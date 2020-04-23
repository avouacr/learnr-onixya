#!/bin/sh

REPO_URL=https://github.com/RLesur/learnr-onixya.git

# Clone the repository in /home/rstudio/tutoriel
mkdir /home/rstudio/tutoriel
git clone $REPO_URL /home/rstudio/tutoriel

# Open the project
echo \
"
setHook('rstudio.sessionInit', function(newSession) {
  if (newSession && identical(getwd(), path.expand('~')))
  {
    message('Ouverture du tutoriel')
    rstudioapi::openProject('~/tutoriel')
  }
}, action = 'append')
" >> /home/rstudio/.Rprofile
