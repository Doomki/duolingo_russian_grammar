# Duolingo Russian Grammar
This repository contains the Tips and notes from all the lessons of Duolingo's Russian course I completed so far.
The content of every lesson is in its own .html and .tex file, in the respective directories.
The `make.sh` file calls `convert.sh`, which converts the .html files to .tex files using pandoc and replaces problematic Unicode
characters. `make.sh` then procedes to generate a PDF from those files.

# Usage
You can either directly download the PDF, or pull everything, make any changes, and then run `./make.sh`
