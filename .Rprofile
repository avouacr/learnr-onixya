setHook("rstudio.sessionInit", function(newSession) {
 if (newSession)
  {
    rstudioapi::navigateToFile("~/tutoriel/demo/demo.Rmd")
    # rmarkdown::run("demo/demo.Rmd")
  }
}, action = "append")
