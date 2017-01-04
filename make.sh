header="\documentclass[a4paper,12pt]{book}
\\usepackage[utf8]{inputenc}
\\usepackage[T1,T2A]{fontenc}
\\usepackage{graphicx}
\\usepackage[russian,english]{babel}
\\usepackage{hyperref}
\\usepackage{longtable}
\\usepackage{booktabs}
\\usepackage{amssymb}

\\providecommand{\\\tightlist}{%
\\setlength{\\itemsep}{0pt}\\setlength{\\parskip}{0pt}}

\\\begin{document}

\\\author{Eelco Empting}
\\\title{Duolingo Russian grammar}
\\date{January 2017}

\\\frontmatter
\\\maketitle
\\\tableofcontents

\\mainmatter

"

includes="$(./convert.sh)\n"

filecontents="$header $includes

\\\backmatter

\\\end{document}"

echo -e "$filecontents" > tmpfile.tex

pdflatex -synctex=1 -interaction=nonstopmode tmpfile.tex
pdflatex -synctex=1 -interaction=nonstopmode tmpfile.tex

mv tmpfile.pdf duolingo_russian_grammar.pdf
rm tmpfile.*
