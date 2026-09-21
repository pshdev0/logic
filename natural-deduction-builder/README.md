# Natural Deduction Builder

An Electron + TypeScript editor for building natural-deduction proof trees and copying TeX for Obsidian or LaTeX.

## Run locally

```bash
npm install
npm run dev
```

## Check and build

```bash
npm run typecheck
npm test
npm run build
```

The default editor stores an explicit proof tree: each conclusion has its own ordered premises and optional rule. Its live preview renders the generated Bussproofs source in MathJax, so export no longer has to guess a tree from a grid of rows and line spans. Add premises above a formula, add a sibling premise immediately to its right, add a step below it, and drag premise branches to reorder or move them. Deductions save automatically in local browser storage.

The original grid editor remains available through **Legacy grid** in the sidebar. Its saved deductions are kept separately and are not automatically converted to trees. Use **Proof tree** there to return to the new editor.

## Export formats

- **Obsidian / MathJax:** `$$`-wrapped Bussproofs with `\require{bussproofs}`.
- **LaTeX bussproofs:** for a document using `\usepackage{bussproofs}`.
- **LaTeX ebproof:** for a document using `\usepackage{ebproof}`.
- **Raw Bussproofs:** the proof-tree environment without a wrapper.

The in-app preview uses the Bussproofs representation of the tree for every format. The ebproof source has the same structure but may be typeset differently in LaTeX. The Obsidian format requires its MathJax installation to allow the `bussproofs` extension.
