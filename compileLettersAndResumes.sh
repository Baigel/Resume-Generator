#!/bin/bash

# Compile All Latex Files
for filename in *.company
do
    name="${filename%.company}"
	pdflatex -jobname="$name" Resume_LaTeX.tex
	pdftk "$name.pdf" academic_transcript.pdf cat output "$name\ 2.pdf"
	mv "$name\ 2.pdf" ./Resumes/"$name Cover Letter and Resume.pdf"
	rm "$name.pdf"
done
