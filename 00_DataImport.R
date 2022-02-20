#Data Preparation for scraping

library(rvest)
library(tidyverse)
library(stringr)
library(httr)
library(XML)

#First task: checking the robots.txt of beppgrillo.it:

#beppegrillo.it/robots.txt gives us a 404-Not Found page!

#Given that, we can procede to download the website

