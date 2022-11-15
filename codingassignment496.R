# packages
require(countrycode)
require(stargazer)
require(httr)

# setting the directory
setwd("C:/Users/c17kr/Dropbox/School Stuff/Social Data Analytics 496")

# get our two datasets in
PolityV <- read.csv("PolityV.csv")
GTD <- read.csv("globalterrorismdb_0718dist.csv")

# going to clean the polity dataset the same way we did in class for the sake of simplicity
pv <- PolityV[c("ccode", "scode", "country", "year", "polity")]
pv <- pv[pv$year >= 1990,]
pv <- pv[pv$polity >= -10,]

# now cleaning the GTD dataset
clean_gtd <- GTD[c("iyear", "country_txt", "attacktype1")]
clean_gtd <- clean_gtd[clean_gtd$iyear >= 1990,]
