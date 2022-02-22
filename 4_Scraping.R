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
  html_elements(css = ".td_module_10 .td-module-title") %>% #Got the selectors with SelectorGadget
  html_elements("a") %>%   #Select the anchor
  html_attr("href")   #Attribute for links


#If I print(link), I see all 10 links for the 10 posts in the first page. The code works

#Now I can do this for each url for the 47 pages. Each page has 10 internal urls

i <- 0
links <- vector()
vector <- vector()

for (i in seq_along(url)){
  vector <- read_html(url[i]) %>% 
    html_elements(css = ".td_module_10 .td-module-title") %>%
    html_elements("a") %>%
    html_attr("href")
  
  links <- append(links, vector)
  
  Sys.sleep(0.2)
}

#I end up with links, a vector of 470 elements



#b. For each single linked blog post, download the page as a file and sys .sleep () a little.

#Create the function for polite download

polite <- function(from_url, to_html, my_email, my_agent = R.Version()$version.string) {
  
  require(httr)
  
  stopifnot(is.character(from_url))
  stopifnot(is.character(to_html))
  stopifnot(is.character(my_email))
  
  req <- httr::GET(url = from_url, 
                         add_headers(
                           From = my_email, 
                           `User-Agent` = R.Version()$version.string
                         )
  )
  # If status == 200, extract content and save to a file:
  if (httr::http_status(req)$message == "Success: (200) OK") {
    bin <- content(req, as = "raw")
    writeBin(object = bin, con = to_html)
  } else {
    cat("Try Again")
  }
}