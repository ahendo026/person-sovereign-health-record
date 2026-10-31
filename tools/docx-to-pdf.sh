#!/usr/bin/env bash
# Convert a .docx to .pdf with LibreOffice, refreshing the table of contents.
# Usage: docx-to-pdf.sh <in.docx> <out.pdf>
#
# `soffice --headless --convert-to pdf` does not refresh fields, so the table
# of contents pandoc writes as a Word field comes out empty. This script
# installs tools/libreoffice/PlanOfRecord.xba into the LibreOffice user
# profile (once, or again when it changes) and runs its DocxToPdf macro,
# which refreshes every index before exporting. If the macro route produces
# no file, it falls back to the plain conversion so a release still builds.
set -u
here="$(cd "$(dirname "$0")/.." && pwd)"
in="$(realpath "$1")"
out="$(realpath -m "$2")"
src="$here/tools/libreoffice/PlanOfRecord.xba"
profile="$HOME/.config/libreoffice/4/user/basic"
lib="$profile/Standard"

if [ ! -d "$lib" ]; then
  # first run creates the profile
  soffice --headless --terminate_after_init >/dev/null 2>&1 || true
fi
if [ -d "$lib" ]; then
  if ! cmp -s "$src" "$lib/PlanOfRecord.xba"; then
    cp "$src" "$lib/PlanOfRecord.xba"
  fi
  if ! grep -q 'library:name="PlanOfRecord"' "$lib/script.xlb"; then
    sed -i 's|</library:library>| <library:element library:name="PlanOfRecord"/>\n</library:library>|' "$lib/script.xlb"
  fi
fi

rm -f "$out"
soffice --headless --invisible --nologo --norestore \
  "macro:///Standard.PlanOfRecord.DocxToPdf(\"$in\",\"$out\")" >/dev/null 2>&1 || true

if [ ! -s "$out" ]; then
  echo "docx-to-pdf: macro route produced no PDF; falling back to --convert-to (table of contents will be empty)" >&2
  soffice --headless --convert-to pdf --outdir "$(dirname "$out")" "$in" >/dev/null 2>&1
  base="$(dirname "$out")/$(basename "${in%.docx}").pdf"
  [ "$base" != "$out" ] && [ -s "$base" ] && mv "$base" "$out"
fi
[ -s "$out" ] && echo "wrote $out"
