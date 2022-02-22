##Task 5: "Check out the RCrawler package and its accompanying paper. What does it mean to “crawl”? 
#and what is it a “web spider”? How is this different from a scraper you have built at point 5? 
#Inspect the package documentation and sketch how you could build a spider scraper: which function(s) should you use? 
#With which arguments? Don't do it, just sketch and explain."


#The package "Rcrawler" allows us to do two tasks at the same time: crawling and scraping.
#Crawling is the process of automatically collecting different URLS from a starting point, 
#scraping is collecting and storing data from the webpages.
#So, web spiders are internet bots that automatically download webpages following hyperlinks.
#The situation in the previous task was different because we just had to  scrape without crawling.

#Rcrawler have a function called "ContentScraper" that needs different arguments: 
#for our usual tasks we can would use Url, CssPatterns and PatternsName 

