install.packages("tidyverse")
install.packages("reshape2")
install.packages("ggplot2")

library(tidyverse)
library(reshape2)
library(ggplot2)

travel <- read.csv('travel_wed.csv', stringsAsFactors = TRUE, na.strings = '-', fileEncoding = 'euc-kr')
str(travel)

attach(travel)

table(BAGE)

BAGE <- table(BAGE)
prop.table(BAGE)

table(BMAR)
BMAR <- table(BMAR)
prop.table(BMAR)

table(A1_1)
A1_1 <- table(A1_1)

table(A2)
A2 <- table(A2)

table(A4_1)
A4_1 <- table(A4_1)
prop.table(A4_1)
barplot(A4_1)

Resi <- table(c(A5_1,A5_2,A5_3,A5_4,A5_5,A5_6,A5_7,
                A5_8,A5_9,A5_10,A5_11,A5_12,A5_13,A5_14,A5_15,A5_16,A5_17,A5_18,A5_19,A5_20))
barplot(Resi)
table(Resi)
table(A5_1)
prop.table(Resi)

table(A6_1)
A6_1 <- table(A6_1)
prop.table(A6_1)
barplot(A6_1)

