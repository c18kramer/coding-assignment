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

# could not decipher which country code is used by GTD, so we cannot use countrycode effectively
# instead i will match up by the name of the country and hope for the best
df = merge(pv, clean_gtd, by.x = c("country", "year"), by.y = c("country_txt", "iyear"))

# try to run a little regression with what we have
m1 = lm(attacktype1 ~ poly(polity, 2), data = df)
summary(m1)

stargazer(m1, type = "html", out = "model.html", covariate.labels = c("Polity", "Polity\\^2", NA)
          , dep.var.labels = c("attack type"), omit.stat = c("ser", "f", "adj.rsq"))

BROWSE("model.html")

