#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd -- "$SCRIPT_DIR/.." && pwd)"
SUPPORT_DIR="$SCRIPT_DIR/pdf-support"
SOURCE_DIR="$ROOT_DIR/md"
OUTPUT_DIR="$ROOT_DIR/output/pdf"
TEMP_PARENT="$ROOT_DIR/tmp/pdfs"

required_commands=(pandoc xelatex perl rg pdfinfo pdftotext)
for command_name in "${required_commands[@]}"; do
  if ! command -v "$command_name" >/dev/null 2>&1; then
    printf 'Error: required command not found: %s\n' "$command_name" >&2
    exit 1
  fi
done

mkdir -p "$OUTPUT_DIR" "$TEMP_PARENT"
TEMP_DIR="$(mktemp -d "$TEMP_PARENT/export.XXXXXX")"

cleanup() {
  rm -rf -- "$TEMP_DIR"
  rmdir "$TEMP_PARENT" 2>/dev/null || true
  rmdir "$ROOT_DIR/tmp" 2>/dev/null || true
}
trap cleanup EXIT

READER='markdown-yaml_metadata_block-grid_tables-simple_tables-multiline_tables-blank_before_header+tex_math_dollars+raw_tex'

export_one() {
  local base_name="$1"
  local source_file="$SOURCE_DIR/$base_name.md"
  local normalized_file="$TEMP_DIR/$base_name.md"
  local temporary_pdf="$TEMP_DIR/$base_name.pdf"

  if [[ ! -f "$source_file" ]]; then
    printf 'Error: source file not found: %s\n' "$source_file" >&2
    exit 1
  fi

  perl "$SUPPORT_DIR/normalize-markdown.pl" < "$source_file" > "$normalized_file"

  pandoc "$normalized_file" \
    --from="$READER" \
    --pdf-engine=xelatex \
    --lua-filter="$SUPPORT_DIR/markdown-to-pdf.lua" \
    --include-in-header="$SUPPORT_DIR/pdf-header.tex" \
    --syntax-definition="$SUPPORT_DIR/isabelle.xml" \
    --highlight-style=tango \
    --toc \
    --metadata=date="" \
    --variable=papersize:letter \
    --variable=geometry:margin=0.78in \
    --variable=fontsize:10pt \
    --variable=monofont:Menlo \
    --output="$temporary_pdf"

  pdfinfo "$temporary_pdf" >/dev/null
  pdftotext -layout "$temporary_pdf" "$TEMP_DIR/$base_name.txt"

  if rg -F '$$' "$TEMP_DIR/$base_name.txt" >/dev/null 2>&1 \
    || rg -F '\require{bussproofs}' "$TEMP_DIR/$base_name.txt" >/dev/null 2>&1 \
    || rg -F '```' "$TEMP_DIR/$base_name.txt" >/dev/null 2>&1; then
    printf 'Error: unrendered Markdown or LaTeX found in %s\n' "$temporary_pdf" >&2
    exit 1
  fi

  printf 'Prepared %s\n' "$temporary_pdf"
}

if (( $# == 0 )); then
  documents=(halbach-logic-notes isabelle-learning-notes)
else
  documents=()
  for argument in "$@"; do
    document="${argument##*/}"
    document="${document%.md}"
    document="${document%.pdf}"
    case "$document" in
      halbach-logic-notes|isabelle-learning-notes)
        documents+=("$document")
        ;;
      *)
        printf 'Error: unknown document: %s\n' "$argument" >&2
        printf 'Expected halbach-logic-notes or isabelle-learning-notes.\n' >&2
        exit 1
        ;;
    esac
  done
fi

for document in "${documents[@]}"; do
  export_one "$document"
done

# Publish only after every requested document has passed validation.
for document in "${documents[@]}"; do
  mv -- "$TEMP_DIR/$document.pdf" "$OUTPUT_DIR/$document.pdf"
  printf 'Created %s\n' "$OUTPUT_DIR/$document.pdf"
done
