
This repository contains the LaTeX source code and additional resources for my PhD thesis, titled

<h3 style="margin-bottom: 0;">Cultural Evolution in the Wild:</h3>
<h4 style="margin-top: 0;">Tracking the Landscape of Learning in Bird Song</h4>

## Repository Structure

- `chapters/`: Contains the LaTeX files for each chapter of the thesis.
- `figures/`: Contains all figures used in the thesis.
- `frontmatter/`: Contains the LaTeX files for the front matter of the thesis.
- `tables/`: Contains all tables used in the thesis.
- `thesis.tex`: The main LaTeX file that compiles the entire thesis.
- `nilosthesis.cls`: The LaTeX class file for the thesis.
- `orcidlink.sty`: A LaTeX package for adding ORCID links.
- `doi.sty`: A LaTeX package for handling DOIs.
- `zotero-library.bib`: The BibTeX file containing all references used in the thesis.

## Building the Thesis

To build the thesis, run something like the following command in your terminal:

```bash
latexmk -shell-escape -synctex=1 -f -file-line-error -xelatex -outdir=. -interaction=nonstopmode -halt-on-error thesis.tex
```