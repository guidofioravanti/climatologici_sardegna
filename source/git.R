rm(list=objects())
library("tidyverse")
library("git2rdata")
library("vroom")


param<-"Tmax"
list.files(pattern=glue::glue("^{param}.+csv$"))->ffile
purrr::map(ffile,.f=function(nomeFile){
  
  vroom(file=nomeFile,delim=";",col_names=TRUE)->dati
  write_vc(x=dati,file=nomeFile,root=glue::glue("./data/{param}"),optimize=TRUE,sorting=c("yy","mm","dd"))
  
})
