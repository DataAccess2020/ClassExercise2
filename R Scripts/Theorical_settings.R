##Task 5: "Check out the RCrawler package and its accompanying paper. What does it mean to “crawl”? 
#and what is it a “web spider”? How is this different from a scraper you have built at point 5? 
#Inspect the package documentation and sketch how you could build a spider scraper: which function(s) should you use? 
#With which arguments? Don't do it, just sketch and explain."


#The package "Rcrawler" allows us to do two tasks at the same time: crawling and scraping.
#Crawling is the process of automatically collecting different URLS from a starting point, 
#scraping is collecting and storing data from the webpages.
#So, web spiders are internet bots that automatically download webpages following hyperlinks.
#The situation in the previous task was different because we just had to scrape without crawling.

#Rcrawler could have solved the previous task with just few lines of code like:

 Rcrawler(
  website = #the url as starting point
  RequestDelay = #similar to sys.sleep, uses a timer to manage the requests
  Useragent = #polite downloading by giving infos about you
  Obeyrobots = #polite download by checking the robots.txt page
  ExtractCSSPat = c(".address") #that works like "css=" in rvest
  DIR = #storage point
 )

#Rcrawler have a function called "ContentScraper" that needs different arguments: 
#for our usual tasks we can would use Url, CssPatterns and PatternsName.

#The structure of a web spider with Rcrawler would be:
#"HTTP requests Handler" that helps us to manage GET and POST operation for the first part of the process;
#"Link Extractor" that parses the website and gives us all the links and hyperlinks;
#"Content duplicate checker" that looks for duplicates;
#"Work-thread manager"that  handles multi-threading and parallel computing.
#"Data extraction" ta component for parsing and extracting web page contents.
#"Index" that helps us store contents of a crawled page.


