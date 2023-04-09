## Installing tidyverse
install.packages("tidyverse")

## Loading tidyverse
library(tidyverse)

## Loading ggplot, which is part of tidyverse
library(ggplot2)

## Importing Dataset
data("msleep")
?msleep

## Checking the first 6 rows of dataset
head(msleep)

## Checking the last 6 rows of dataset
tail(msleep)

## Checking dimension of dataset
dim(msleep)

## Checking column names
names(msleep)

colnames(msleep)

## Checking the number of missing values in each column
sapply(msleep, function(x) sum(is.na(x)))

## Using the map function to check for the number of missing values
msleep %>% 
  map(is.na) %>% 
  map(sum)

## Calculating proportion of missingness in each variable
msleep %>% 
  map(is.na) %>% 
  map(sum) %>%
  map(~ ./nrow(msleep)) %>%  
  bind_cols()


####Selecting Missing Variables####

## Select the vore, sleep_rem, sleep_cycle, and brainwt
msleep_data <- msleep %>%
  select(vore, sleep_rem, sleep_cycle, brainwt)

## Print the new msleep data
msleep_data

## Check the dimension of the new data
dim(msleep_data)

view(msleep_data)

####Dropping Missing Rows####

## Drop rows with NA values in the vore column
msleep_data <- msleep_data %>%
  drop_na(vore)

## Check the dimension of the new data
dim(msleep_data)

####Replacing Missing Values####
## Replace the NA values in the sleep_rem column with integer zero values (0L).
msleep_data %>% 
  replace_na(list(sleep_rem = 0L))

## Replace the missing values in the sleep_cycle column using the median of the values
msleep_data %>%
  mutate(sleep_cycle = replace_na(sleep_cycle,
                                  median(sleep_cycle, na.rm = T)))


####Filling Missing Values####
## Fill the brainwt column upwards


## Replace the NA values in the sleep_rem column with integer zero values (0L).
## Fill the brainwt column upwards



####Combining and Chaining the ## operations using the pipe operator####

## Chain all the steps together and
## save the result as msleep_data
msleep_data <- msleep_data %>% 
  replace_na(list(sleep_rem = 0L)) %>%
  fill(brainwt, .direction = "up") %>%
  mutate(sleep_cycle = 
           replace_na(sleep_cycle, 
                      median(sleep_cycle, na.rm = T)))

## Print the cleaned data
msleep_data



