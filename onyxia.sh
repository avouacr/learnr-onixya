#!/bin/sh

REPO_URL=https://github.com/avouacr/learnr-onixya.git
WORK_DIR=/home/onyxia/work
TUTO_DIR=${WORK_DIR}/tutoriel

# Clone the repository in /home/rstudio/tutoriel
git clone $REPO_URL $TUTO_DIR
mc cp s3/avouacr/sect01_seq_01(1).qmd $TUTO_DIR/demo/sect01_seq_01(1).qmd
chown -R onyxia:users $TUTO_DIR

# Install dependencies
# Rscript -e "remotes::install_deps(pkgdir = '${TUTO_DIR}', dependencies = TRUE, upgrade = FALSE)"

# Open the project
echo \
"
setHook('rstudio.sessionInit', function(newSession) {
  if (newSession && identical(getwd(), '${WORK_DIR}'))
  {
    message('Activation du projet RStudio')
    rstudioapi::openProject('${TUTO_DIR}')
  }
}, action = 'append')
" >> /home/onyxia/.Rprofile
