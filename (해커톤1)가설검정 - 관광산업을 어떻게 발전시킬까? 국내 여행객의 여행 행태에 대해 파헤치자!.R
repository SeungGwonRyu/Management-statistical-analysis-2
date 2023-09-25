travel <- read.csv('travel_wed.csv', stringsAsFactors = TRUE, na.strings = '-', fileEncoding = 'euc-kr')
install.packages("car")
library(car)

t.test(travel$A10,mu=2.0)

travel$A2<-as.factor(travel$A2)
leveneTest(travel$A10, travel$A2, center=mean)
t.test(travel$A10~travel$A2,alter="greater", var.equal=FALSE)

age<-aov(travel$A10~travel$BAGE,data=travel)
summary(age)

travel$BSEX<-as.factor(travel$BSEX)
A<-lm(A10~A7+BSEX, data=travel)
summary(A)
