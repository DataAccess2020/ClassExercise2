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

