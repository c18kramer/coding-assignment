# packages
require(countrycode)
require(stargazer)
require(httr)

# setting the directory
setwd("C:/Users/c17kr/Dropbox/School Stuff/Social Data Analytics 496")

# get our two datasets in
PolityV <- read.csv("PolityV.csv")
GTD <- read.csv("globalterrorismdb_0718dist.csv")