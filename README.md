# Resume-Generator

Dear Future Employers: Please don't judge me.

A small script that generates multiple Resume's from a set of company-specific variables

Given several `*.company` files generate a new pdf (in the `./Resumes` directory for each company. Although running the `GenerateResumes.sh` script works just fine, a Makefile has been included as the .DEFAULT_GOAL includes a cleanup process which gets rid of unneeded `*.log`, `*.aux` and `*.out` files that clog up the working directory.
