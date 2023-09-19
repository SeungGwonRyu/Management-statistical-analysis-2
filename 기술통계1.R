#실습2- 기술통계 다시 해보기

##데이터 불러오기
SAL <- read.csv('salary.csv', stringsAsFactors = T, na="-", fileEncoding = "EUC=KR") 
#데이터 유형이 문자형인 경우, 데이터 프레임을 생성할 때 FACTOR로 생성(명목 척도)
head(SAL,5) #SAL변수의 관측값 중 5번째까지의 데이터를 나타냄
View(SAL)

str(SAL) #SAL 변수의 내부구조를 나타냄

#변수명을 바꿔줌
colnames(SAL) #변수명확인
colnames(SAL)<- c('age', 'salary', 'specialSalary', 'workingTime', 'numberOfWoker', 'career', 'sex')
colnames(SAL)



#ATTACH 등록
attach(SAL)

#평균 구하기
Mean <- mean(salary, na.rm=T)
Mean


#중앙값 구하기
MID <- median(salary, na.rm=T)
MID

#범위 구하기
Range <- range(salary, na.rm=T)
Range

#최대값, 최소값 구하기
MIN <- min(salary, na.rm=T)
MIN

MAX <-max(salary, na.rm=T)
MAX

M<- which(salary==4064286)#4064286을 받고 있는 사람을 확인하고 인덱스를 M변수로 저장
M

SAL[M,] #M의 행 값을 나타냄


#월급의 사분위 구하기
Qnt <- quantile(salary, na.rm = T)
Qnt

qnt<-quantile(salary,na.rm=T)
qnt
#구한 모든 값을 하나의 리스트에 담아내기
salary <- list(Mean=Mean, MID=MID, Range=Range, Qnt=Qnt) #영어로 표현
salary

#근무 기간(경력) 별로 평균 월급 구하기
careeral<- tapply(SAL$salary, SAL$career, mean, na.rm=T)
##tapply 함수-데이터를 주어진 기준에 따라 그룹으로 묶은 뒤 각 그룹에 함수를 적용하고 그 결과를 반환
### 즉 career 그룹에 따라 salary 의 평균값을 도출
careeral

#결과를 그래프로 그리기
install.packages("reshape2") #reshape2는 시각화 패키지
install.packages("ggplot2") #ggplot2는 시각화 패키지
library(reshape2)
library(ggplot2)

melt <- melt(careeral) #reshape2 의 melt 함수 활용
melt


ggplot(melt, aes(x=Var1, y=value, fill='red')) + geom_bar(stat = 'identity')
options("scipen"=100)

#표준편차 구하기
tapply(SAL$salary, SAL$career, sd, na.rm=T) #경력별 월급 표준편차 도출
sdcareer<-tapply(SAL$salary, SAL$career, sd, na.rm=T) ##sdcareer에 경력별 월급 표준편차 저장
sdcareer2<-melt(sdcareer)
sdcareer2


#범위 구하기
tapply(SAL$salary, SAL$career, sd, na.rm=T)

