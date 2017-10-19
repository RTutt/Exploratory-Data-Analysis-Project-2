# Plot 6

library(dplyr)
library(ggplot2)
library(ggthemes)
library(gridExtra)

setwd("C:\\Users\\RTutt\\Desktop\\Exploratory Data Analysis\\Assignment 2")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

balt <- subset(NEI, fips == "24510" & type == 'ON-ROAD')
la <- subset(NEI, fips == "06037" & type == 'ON-ROAD')

baltyearly <- balt %>%
  group_by(year) %>%
  summarise(Emissions = sum(Emissions))

layearly <- la %>%
  group_by(year) %>%
  summarise(Emissions = sum(Emissions))

layearly$area <- 'Los Angeles'
baltyearly$area <- 'Baltimore'

dataset <- as.data.frame(rbind(layearly, baltyearly))

png("plot6.png", width=700, height=500)

ggplot(data = dataset, aes(x = as.factor(year), y = Emissions, fill = area)) +
  geom_bar(stat = "identity") +
  facet_grid(.~ area) +
  labs(title = 'Motor Vehicle Emissions: Baltimore vs Los Angeles',
       x = 'Year',
       fill = 'Area') +
  theme(plot.title = element_text(hjust = 0.5, size = 14, face = "bold"),
       axis.title.x = element_text(size = 10),
       axis.title.y = element_text(size = 10),
       legend.position = 'none') +
  geom_text(aes(label=format(round(Emissions,0),big.mark = ",", scientific = FALSE), size=1, hjust=0.5, vjust=-0.5))

dev.off()
