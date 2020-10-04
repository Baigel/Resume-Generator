.DEFAULT_GOAL=all
SHELL := /bin/bash

all: compileAll
all: clean

compileAll:
	bash ./compileLettersAndResumes.sh

clean:
	bash -c "rm *.out"
	bash -c "rm *.log"
	bash -c "rm *.aux"
