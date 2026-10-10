# Logic notes

This repository contains two sets of logic and Isabelle/HOL learning notes:

- [Isabelle learning notes](md/isabelle-learning-notes.md)
- [Halbach logic notes](md/halbach-logic-notes.md)

The Markdown files are best viewed in [Obsidian](https://obsidian.md/), which renders their inline and display LaTeX mathematics correctly. GitHub may show the `$...$` and `$$...$$` delimiters instead of rendering some expressions.

PDF versions with typeset mathematics are available in [`output/pdf`](output/pdf/).

## Exporting the PDFs

Run the export script from anywhere inside the repository:

```bash
./scripts/export-pdfs.sh
```

This regenerates both PDFs without modifying the Markdown sources. To export only one document, pass its name:

```bash
./scripts/export-pdfs.sh halbach-logic-notes
./scripts/export-pdfs.sh isabelle-learning-notes
```

The script requires Pandoc, XeLaTeX, Perl, ripgrep and Poppler (`pdfinfo` and `pdftotext`).

# Natural Deduction Builder

The `natural-deduction-builder` folder contains a Natural Deduction creation tool to generate LaTeX natural deduction arguments; this is used to assist writing the logic notes.

