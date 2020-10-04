#!/bin/bash

# Script to generate multiple resumes from multiple *.company files
# Not the most efficient way to do things 
# (i.e should use `for %i in (*.company)` instead, 
# so that only name of company used and '.company' 
# part of name not included

# Create child directory to hold resumes (if it doesn't already exist)
mkdir -p ./Resumes

# Loop through each file name
for filename in *.company
do
    # Get just the name of the company (kinda hacky - regex would be better)
    name="${filename%.company}"
	
    # Generate the pdf by importing the .company file
    pdflatex -jobname="$name" Resume_LaTeX.tex
    # Try to concatinate academic_transcript.pdf onto cover letter/resume
    pdftk "$name.pdf" academic_transcript.pdf cat output "$name\ 2.pdf"
    # If the concatenation was successfil then move the whole pdf to the 
    # subdirectory and remove the original. If academic_transcript.pdf 
    # doesn't exist, just move the pdf
	if [ $? -ne 0 ]
    then
        mv "$name.pdf" ./Resumes/"$name Cover Letter and Resume.pdf"
	else
        mv "$name\ 2.pdf" ./Resumes/"$name Cover Letter and Resume.pdf"
        rm "$name.pdf"
    fi
done
