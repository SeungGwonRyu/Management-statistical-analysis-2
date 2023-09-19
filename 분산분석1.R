##11주차

#지수표기를 숫자표기로 변경
options(scipen=100)

############

#일원분산분석 실습
#데이터프레임 만들기
ID<-c(1,2,3,4,5,6,7,8,9,10,11,12)
coffee<-c(1,1,1,1,2,2,2,2,3,3,3,3)
score<-c(3,4,2,5,5,4,7,3,9,7,9,8)

DF_A<-data.frame(ID,coffee,score)

#데이터프레임 구조 확인
str(DF_A)
head(DF_A)

#데이터 형태 변환
DF_A$coffee<-as.factor(DF_A$coffee) #coffee 명목척도(요인, factor)로 변환
str(coffee)

attach(DF_A)

#기술통계
tapply(DF_A$score,DF_A$coffee,mean) #커피 종류에 따른 선호도 평균
boxplot(score~coffee)

tapply(DF_A$score, DF_A$coffee, mean)


#일원(배치) 분산분석
ANOVA1<-aov(score~coffee,data=DF_A) #aov(종속변수~독립변수, data=데이터명)
summary(ANOVA1)

ANOVA1<-aov(score~coffee, data=DF_A)



#사후검정(post-hoc)
###사후분석을 위한 패키지 설치
install.packages("agricolae")
library(agricolae)
TukeyHSD
scheffe.test( , "coffee",console=T)
duncan.test( , aplha=, console)

#사후검정
TukeyHSD(ANOVA1) #2번과 1번의 차이는 없다. 3번과 1번의 차이는 있다. 3번과 2번번의 차이는 있다.
scheffe.test(ANOVA1,"coffee",console=T) #1번 2번은 차이 없다(b) 3번 다른집단
duncan.test(ANOVA1,"coffee", alpha=0.05,console=T) #1,2번은 같은 집단 3번은 다른집단
#사후검정결과 : 적어도 한집단은 다르다에서 한집단은 3번집단을 의미 3번집단은 다르다라고 결론

#######
##이원(배치)분산분석
###데이터프레임 만들기
Temperature<-c(1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3)
Time<-c(1,1,1,2,2,2,2,3,3,3,1,1,1,2,2,2,2,3,3,3,1,1,1,2,2,2,2,3,3,3)
level<-c(4,5,2,4,5,3,6,5,4,3,1,2,2,6,7,5,NA,3,4,3,5,4,6,4,3,4,NA,4,5,NA)

DF_B<-data.frame(Temperature,Time,level)
DF_B
#데이터프레임 구조 확인
str(DF_B)
head(DF_B)
detach(DF_A)
attach(DF_B)
##데이터형태변환
DF_B$Temperature<-as.factor(DF_B$Temperature) ##Temperature 명목척도(요인, factor)로 변환
DF_B$Time<-as.factor(DF_B$Time)

#기술통계
tapply(DF_B$level,DF_B$Temperature,mean,na.rm=T) ##온도에 따른 맛등급 평균
tapply(DF_B$level,DF_B$Time,mean,na.rm=T) ##시간에 따른 맛등급 평균

#이원분산분석
ANOVA2<-aov(DF_B$level~DF_B$Temperature*DF_B$Time) #온도에따라 맛등급 차이 없다, 시간에 따라 맛등급 차이 있다
## 온도와 시간의 상호작용효과는 있다라고 판정
summary(ANOVA2)
aov(DF_B$level~DF_B$Temperature*DF_B$Time)

#post hoc test(사후검정)
TukeyHSD(ANOVA2)  #온도 : 귀무가설 채택 확인 사후검정에서 귀무가설 : 집단간의 평균의 차이가 없다.
#시간 : 대립가설 채택 확인 집단간의 평균의 차이 있다
#2번과 1번만 차이가 있음을 확인인
interaction.plot(DF_B$Temperature,DF_B$Time,DF_B$level)

scheffe.test(ANOVA2,"DF_B$Time",console=T)
##1번과 2번은 다른그룹 차이가 있다
#3번은 a에도 속하고 b에도 속한다. (1,3) (2,3)간에는 차이가 없다.


###13주차 분산분석2
#WOKRSHOP-스마트폰 브랜드에 따라 소비자들이 인식하는 스마트폰의 품질에 차이가 있는가?(일원분산분석)
smartphone<-read.csv("workshop10.csv") #파일 불러오기
str(smartphone)

SP1<-smartphone[,c(2,4)]
str(SP1)

SP1$brand<-as.factor(SP1$brand)
str(SP1)

summary(SP1)
tapply(SP1$quality,SP1$brand,mean)##기술통계, 브랜드별 스마트폰 품질 인식 평균비교
tapply(SP1$quality,SP1$brand,sd)##기술통계, 브랜드별 스마트폰 품질 인식 표준편차

ANOVA_SP1<-aov(SP1$quality~SP1$brand,data=SP1)##일원(배치)분산분석
summary(ANOVA_SP1)  #귀무가설 채택 브랜드이미지에따른 품질차이는 없다

#############
##WORKSHOP-스마트폰 브랜드와 성별에 따라 스마트폰에 대한 전반적 만족도에 차이가 있는가? (이원분산분석)
SP2<-smartphone[,c(2,3,8)] #필요한 데이터만 불러오기
str(SP2)

SP2$brand<-as.factor(SP2$brand)  ##브랜드를 요인(그룹,명목척도)으로변환
SP2$sex<-as.factor(SP2$sex)  ##성별을 요인(그룹,명목척도)으로 변환
str(SP2)

summary(SP2) ##기술통계, 요약
tapply(SP2$satisfaction, SP2$brand, mean, na.rm=T) #브랜드에 따른 전반적 만족도 평균
tapply(SP2$satisfaction, SP2$brand, sd, na.rm=T)#기술통계, 브랜드별 스마트폰 품질 인식 표준편차
tapply(SP2$satisfaction, SP2$sex, mean, na.rm=T)#성별에 따른 전반적 만족도 평균
tapply(SP2$satisfaction, SP2$sex, sd, na.rm=T)# 기술통계, 성별에 따른 스마트폰 품질 인식 표준편차

ANOVA_SP2<-aov(SP2$satisfaction~SP2$brand*SP2$sex) #이원분산분석
summary(ANOVA_SP2) ##브랜드에따른 전반적 만족도 차이가 존재함을 알 수 있음
##-->> 사후검정을 통해서 어떤 집단간에 차이가 있는지 확인해야겠다!!
## post hoc test(사후검정)
TukeyHSD(ANOVA_SP2) ##brand에서 p adj랑 유의수준 비교해서 집단간 차이 확인
scheffe.test(ANOVA_SP2, "SP2$brand", console=T) ##그룹나뉘어져있는 aab보기

interaction.plot(SP2$brand,SP2$sex,SP2$satisfaction) ##이거는 몰라도 됨ㅋ
##3개집단 이상의 평균의 집단의 차이를 비교할때는 분산의 비교를 통해 평균을 비교 >> 분산분석

##13주차 회귀분석
#회귀분석(Regression Analysis)
##데이터셋 만들기
X<-c(4,8,9,8,8,12,6,10,6,9)
Y<-c(9,20,22,15,17,30,18,25,10,20)
CF<-data.frame(X,Y)
CF

##단순회귀분석
R_CF<-lm(Y~X, data=CF) ##앞이 종속변수, 뒤가 독립변수 # Y의 종속변수는 X라는 변수에 영향이 있는지?
R_CF  

summary(R_CF)  #표본에만 해당되는 것인지 모집단 전체로 일반화 할 수 있는지 p-value 확인
#0.05보다 작기때문에 표본에만 해당되는 것이아니라 모집단에도 해당
##회귀식 Coefficients 회귀식이 유의한지 유의확률로 확인 가능 0.05작기 때문에 유의하다.  회귀식 :  y = 2.6087*x -2.2696
#단순회귀분석에서는 수정된 결정계수 X 그냥 결정계수



##다중회귀분석
mtcars ##사용할 데이터 확인
MTC2<-mtcars ##데이터 불러오기

MLM2<-lm(hp~cyl+wt, data=MTC2) ##다중회귀분석 수행, 독립변수 2개, 종속변수 1개
summary(MLM2) ##회귀분석 결과 요약
#마지막에 있는 p-value값 확인 -> 모집단 확장 가능 cyl은 쓸수 있음 wt는 회귀식에서 쓸 수 없다.
#Adjusted R-squared:  0.6719 는 cyl과 wt는 hp를 67.19% 설명할 수 있다고 말해주는 것

MLM3<-lm(hp~cyl, data=MTC2) #독립변수 1개 제거  ##확장적용 가능, cyl의 회귀계수 유의하다. 종속변수에 대한 독립변수의 설명력은  68.27%이다.
summary(MLM3) ##cyl의 회귀계수는 유의하다

#표준화계수  독립변수들의 종속변수에 대한 상대적 중요도를 계산 가능 #위에서 나온 회귀식의 단위값을 제거
install.packages("lm.beta")
library(lm.beta)

MLM2S<-lm.beta(MLM2)
summary(MLM2S)  ##Standardized -> 단위의 영향력이 사라졌다. 종속변수의 영향을 얼마나 미치는지 확인
##hp에 더 영향을 많이 미치는 거는 cyl


