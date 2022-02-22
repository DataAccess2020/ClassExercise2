#a. For each of the 47 pages, get all the links and place them into a 
#list (or character vector). Tip: see how the URL changes to build 
#the loop! 

library(stringr)

url <- c("https://beppegrillo.it/category/archivio/2016/",
         str_c("https://beppegrillo.it/category/archivio/2016/page/", 2:47))
#The first url was different than the others, as only 2:46 contained "/page/n"


#In order to do point b, I need to get every url for the 10 posts in each page
#I'm gonna do it for the first page, to get the strategy

prova <- "https://beppegrillo.it/category/archivio/2016/"


library(rvest)

link <- read_html(prova) %>%
  html_elements(css = ".td_module_10 .td-module-title")

#If I print(link), I see all 10 links for the 10 posts in the first page. The code works