# Assignment Plot 2

library(dplyr)
library(ggplot2)

setwd("C:\\Users\\RTutt\\Desktop\\Exploratory Data Analysis\\Assignment 2")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

balt <- subset(NEI, fips == "24510")

yearlyemissions <- balt %>%
  group_by(year) %>%
  summarise(Emissions = sum(Emissions))


png("plot2.png", width=700, height=500)

barplot(yearlyemissions$Emissions, names.arg = yearlyemissions$year, col = 4,
        main = 'Total Emissions per Year: Baltimore', xlab = 'Year', ylab = 'Total PM2.5 Emissions')

dev.off()
