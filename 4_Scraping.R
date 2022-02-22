#a. For each of the 47 pages, get all the links and place them into a 
#list (or character vector). Tip: see how the URL changes to build 
#the loop! 

library(stringr)

url <- c("https://beppegrillo.it/category/archivio/2016/",
         str_c("https://beppegrillo.it/category/archivio/2016/page/", 2:47))
#The first url was different than the others, as only 2:46 contained "/page/n"
