############# Merging All Yearly Datasets Together & Checking Data #############

## Installing and Attaching R Packages ##

install.packages(c("tidyverse", "janitor", "data.validator", "lubridate", "data.table", "plyr", "knitr","readr"))

library(tidyverse)
library(janitor)
library(data.validator)
library(ggplot2)
library(plyr)
library(dplyr)
library(lubridate) 
library(data.table)
library(stringr)
library(knitr)
library(tidyr)
library(readr)

# Set your working directory to where the CSV files are located
setwd("C:/Users/clair/OneDrive/Desktop/UpdatedCode_MergedData")


# Get a list of all CSV files in the directory
csv_files <- list.files(pattern = ".csv")

# Read and combine all CSV files using dplyr::bind_rows()
prepare_cyclisticdata <- lapply(csv_files, function(x) read.csv(x, stringsAsFactors = FALSE, 
                                                                colClasses = c("start_station_id" = "character", "end_station_id" = "character"))) %>% 
  bind_rows()

# View the first few rows of the data
head(prepare_cyclisticdata)

# View summary statistics for the data
summary(prepare_cyclisticdata)

# View the last few rows of the data
tail(prepare_cyclisticdata)

# Save merged data as CSV
write.csv(prepare_cyclisticdata, file = "prepare_cyclisticdata.csv", row.names = FALSE)
