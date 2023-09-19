setwd("/cloud/project") #분석 경로 설정
getwd() # 경로 확인



#패키지 설치 및 불러오기 - 엑셀로 저장된 데이터셋 불러오기
install.packages("readxl")
library(readxl)
install.packages("tidyverse") # 데이터 분석을 위한 패키지 모음
library(tidyverse)
install.packages("dplyr")
library(dplyr)

#데이터셋 가져오기
MD <-read_excel("MD.xlsx")

#데이터셋 확인하기
View(MD) #앞에는 대문자
head(MD) #데이터프레임 제일 앞 6줄 출력
tail(MD) #데이터프레임 제일 마지막 6줄 출력

#데이터 구조 확인하기
dim(MD) #행렬구조
str(MD)

#기본 통계량 요약
summary(MD)

#분석에 필요한 변수만 가져오기
SortMD<-MD[c("SQ1","SQ2", "SQ3", "q2", "q5", "q7-1", "q7-2", "q7-3","q7-4", "q7-5","q14", "q14-1-1","q14-1-2","q14-1-3","q14-1-4","q14-1-5","q14-1-6","q14-1-7","q14-3", "q14-4", "q15", "q16", "q17", "q17-1", "q18", "q18-1")]
str(SortMD)


##변수명 변경: '-' 하이픈은 빼기로 인식 할 수 있으므로 변수명으로 사용하지말자
SortMD<- rename(SortMD,"q7_1"="q7-1","q7_2"="q7-2", "q7_3"="q7-3", "q7_4"= "q7-4", "q7_5"="q7-5", "q14_3"="q14-3", "q14_4"="q14-4", "q17_1"="q17-1", "q18_1"="q18-1","q14_1_1"="q14-1-1","q14_1_2"="q14-1-2","q14_1_3"="q14-1-3","q14_1_4"="q14-1-4","q14_1_5"="q14-1-5","q14_1_6"="q14-1-6","q14_1_7"="q14-1-7")

dim(SortMD)
str(SortMD)

attach(SortMD)
View(SortMD)

#데이터 값 변환
substr(SQ2,1,1) #왼쪽 첫번째 ~ 첫번째 값만 반환
SortMD2<-SortMD %>% ##%>% 체인 연산자로 dplyr 패키지를 불러오면 사용할 수 있음, 체인과 같이 연결 역할을 함
mutate_all(substr,1,1)  ##substr 함수를 전체 열(column)에 적용

View(SortMD2)

#데이터 유형 변경
str(SortMD2) #데이터셋 구조 확인
str(q17_1)

detach(SortMD)
attach(SortMD2)

#명목척도로 변환
SortMD2 %>%
select(1:26) %>%
mutate_all("as.factor") -> SortMD2[,1:26]

str(SortMD2)

## 등간척도이기 때문에 숫자로 변환
SortMD2 %>%
mutate_at(vars(q15,q17,q18), as.integer) -> SortMD2
str(SortMD2)


##빈도계
table(SQ1)
table(SQ2)
table(SQ3)
table(q14_3)
table(q15)


table(SQ2, SQ3) #교차표

##비율계산
SA<-table(SQ2,SQ3)
prop.table(SA) #도수분포표 도출 이후에 상대도수 구하기
Resi<-table(SA)


Resi<-table(q15)
prop.table(Resi)

Resi<-table(q15)
prop.table(Resi)

table(q5)
g_q5<-table(q5)
prop.table(g_q5)
barplot(g_q5) ##막대그래프

#차트
pie(Resi) #파이차트
barplot(Resi)


#기술통계량 요약
summary(SortMD2) #기본 기술통계량 제공 #factor형의 요약 값들과 integer 형의 요약 값들의 비교
print(summary(SortMD2))

#수치형 자료 기술통계량
mean(q18) #산술평균
mean(q18, na.rm=T)
is.na(q18) #결측치 여부 확인
sum(is.na(q18)) #NA(결측치) 갯수 확인
median(q18) #중앙값
 

var(q18,na.rm=T) #표본분산
sd(q18,na.rm=T) #표본표준편차

by(q15, SQ3,mean) #by(양적자료, 질적자료, 함수이름 (기술통계))
by(q15, SQ3,var)
by(q15, SQ3,sd)

##벡터값 적용하기
table(c(q14_1_1,q14_1_2,q14_1_3,q14_1_4,q14_1_5,q14_1_6,q14_1_7))
Resi<-table(c(q14_1_1,q14_1_2,q14_1_3,q14_1_4,q14_1_5,q14_1_6,q14_1_7))
prop.table(Resi)
barplot(Resi)

sum(table(q14))

##역코딩 1(매우좋음) -> 5 5->1 평균 및 4분위수 해석에 용이성 확보  (리커트 척도)
reverse_q2<-6-SortMD2[c("q15","q17","q18")] ##변수명을 알고 있는 경우 (이게더 나을듯)
reverse_q<-6-SortMD2[c(14,16,18)] #열 위치를 알고 있는 경우

SortMD2[c("q15","q17","q18")]<-reverse_q2[c("q15","q17","q18")] ##한번에 대체
table(q15)

## 6, 7, 9 를 5로 바꾸기
q14_4<-replace(q14_4,q14_4==6,5)
q14_4<-replace(q14_4,q14_4==7,5)
q14_4<-replace(q14_4,q14_4==9,5)
summary(q14_4)
attach(SortMD2)

q14_4
table(q14_4)
q14_4<-table(q14_4)
q14_4   ##q14_4 가 현재 테이블형태임
barplot(q14_4)

## 6, 7, 9를 없애기 위해 열삭제를 하기위해 데이터 프레임형태로 변환
q14_4<-data.frame(q14_4)
q14_4
q14_4 <-t(q14_4)
q14_4
q14_4<-q14_4[,c(1:5)]
q14_4
barplot(q14_4)
barplot(q14_4, names=c("1","2","3","4","5"))
str(q14_4)
barplot(q14_4, names=c("필요성을 못느낌","2","3","4","5"))
barplot(q14_4, names=c("필요성을 못느낌","2","3","4","5"), xlab="reason", ylab="responses") ##x축 y축 제목 넣기
barplot(q14_4,names=c('1','2','3','4','5'),xlab="reason",ylab="responses")
##하나의 데이터로 만든 후 막대 그래프 그리기
data <-c(q14_1_1) 3#등등 난 위에서 하나씩 다 넣어서 했음





