#!/bin/sh

REPO_URL=https://github.com/avouacr/learnr-onixya.git
TUTO_DIR=/home/onyxia/work/tutoriel

# Clone the repository in /home/rstudio/tutoriel
git clone $REPO_URL $TUTO_DIR

# Install dependencies
Rscript -e "remotes::install_deps(pkgdir = ${TUTO_DIR}, dependencies = TRUE, upgrade = FALSE)"

# Open the project
echo \
"
setHook('rstudio.sessionInit', function(newSession) {
  if (newSession && identical(getwd(), path.expand('~')))
  {
    message('Ouverture du tutoriel')
    rstudioapi::openProject('~/work/tutoriel')
  }
}, action = 'append')
" >> /home/rstudio/.Rprofile
