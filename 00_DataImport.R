#Data Preparation for scraping


#First task: checking the robots.txt of beppegrillo.it:

#beppegrillo.it/robots.txt gives us a 404-Not Found page!

#Given that, we can procede to download the website; to download the website page politely
#we can create a function that download while giving our email and R version details to the webmaster:


library(rvest)
library(tidyverse)
library(stringr)
library(httr)
library(XML)
library(httr)

polite <- function(from_url, to_html, my_email, my_agent = R.Version()$version.string) {
  
  
  require(httr)
  
  # Check that arguments are inputted as expected:
  stopifnot(is.character(from_url))
  stopifnot(is.character(to_html))
  stopifnot(is.character(my_email))
  
  # GET politely
  grillo_scrape <- httr::GET(url = from_url, 
                             add_headers(
                               From = my_email, 
                               `User-Agent` = R.Version()$version.string
                             )
  )
  
  
  if (httr::http_status(grillo_scrape)$message == "OK") {
    bin <- content(grillo_scrape, as = "raw")
    writeBin(object = bin, con = to_html)
  } else {
    cat("Try again")
  }
}

polite(from_url = "https://beppegrillo.it/un-mare-di-plastica-ci-sommergera/", 
       to_html = here::here("grillo_plastica.html"), 
       my_email = "antonio.alaia@studenti.unimi.it")

#Now we have the downloaded in local and so we can procede to scrape the links we need:


all_links <- XML::getHTMLLinks(here::here("grillo_plastica.html"))

#here we use the regex to select only the website intern links

grillo_links <- (stringr::str_extract(all_links, pattern = "^https://beppegrillo.it.*")) 


length(unique(grillo_links))

#we noticed that there are a lot of duplicates, so we use "unique" and then "na.omit" to remove NAs

grillo_links <- unique(unlist(strsplit(grillo_links, " ")))
grillo_links <- na.omit(grillo_links)


grillo <- data.frame(grillo_links) #here's our data frame with 29 links!

view(grillo_links)

##Tasks 1,2 and 3 completed!


