SortMD <- MD[c("q14","q15","q17","q18")]

SortMD2<-SortMD%>%
mutate_all(substr,1,1)  

str(SortMD2)

SortMD2 %>%
mutate_at(vars(q15,q17,q18),as.integer)->SortMD2  
str(SortMD2)

SortMD2$q14<-as.factor(SortMD2$q14)
summary(SortMD2)

reverse_q<-6-SortMD2[c("q15","q17","q18")]

SortMD2[c("q15","q17","q18")]<-reverse_q[c("q15","q17","q18")]

summary(SortMD2)




#가설검정
##일표본 T검정
t.test(SortMD2$q15,mu=1.42)##양측 검정(달라졌는가, 유의수준 0.05)
t.test(SortMD2$q15, mu=1.42, alter="greater") ##단측검정(커졌는가), 유의수준 0.05,작은지 검정 : alter="Less")



##결과 목록으로 보기
a1<-t.test(SortMD2$q15 , mu=1.42) #양측 검정(달라졌는가), 유의 수준 0.05
a2<-t.test(SortMD2$q15 , mu=1.42, alter="greater") #단측검정 (커졌는가)
a3<-t.test(SortMD2$q15 , mu=1.42, alter="greater", conf.level=0.90) ##유의수준 0.10
a4<-t.test(SortMD2$q15 , mu=1.42, conf.level=0.99) #유의수준 0.01



#독립표본 T검정
##분산의 동질성 검정 (두 집단의 등분산 검정)
install.packages("car")
library(car)

by(SortMD2$q17, SortMD2$q14, mean)

leveneTest(SortMD2$q17, SortMD2$q14, center=mean) #Levene(레빈) 등분산 검정, 분산의 동질성

t.test(SortMD2$q17~SortMD2$q14, var.equal=FALSE) #분석대상 변수~ 집단변수, 이분산일 경우, 양측검정
t.test(SortMD2$q17~SortMD2$q14, alter="greater", var.equal=FALSE)  #이분산일 경우, 단측검정
t.test(SortMD2$q17~SortMD2$q14, var.equal=TRUE)##분석대상 변수~집단변수, 등분산일 경우

##검정통계량, 자유도 다름, 가설검정이 다른경우는 겨우 없음

options(scipen=100) ##지수표기를 일반표기로 변경
options(scipen=0)

t.test(SortMD2$q18,mu=2.5)

ABC<-read_excel("ABC.xlsx")
attach(ABC)
t.test(pre,post,paried=TRUE)
detach(ABC)

by(SortMD2$q18, SortMD2$q14, mean)
leveneTest(SortMD2$q18, SortMD2$q14, center=mean)
t.test(SortMD2$q18~SortMD2$q14, var.equal=FALSE)



#과제 풀이
q18h<-t.test(SortMD2$q18, mu=3.2) ##달라졌는가
q18h2<-t.test(SortMD2$q18, mu=3.2, alter="greater") #높아졌는가
t.test(SortMD2$q18, mu=3.2)
t.test(SortMD2$q18, mu=3.2, alter="greater")


a18h2<-t.test(SortMD2$q18, mu=3.2, conf.level=0.99) #추정의 결과가 바뀌는 것을 확인할 수 있음, 유의확률은 변하지 않음
q18h<-t.test(SortMD2$q18, mu=3.2) ##달라졌는가
t.test(SortMD2$q18, mu=3.2, conf.level=0.99)


#대응표본 T검정(paired T test) 전, 후의 차이가 없을 것이다, 있을 것이다.
t.test(ABC$pre, ABC$post, paried=TRUE) ##pre, post는 변수명으로 '데이터셋명'+'$' 입력
t.test(ABC$pre,ABC$post, paired=TRUE)

##독립표본 T검정
install.packages("car") ## 등분산 검정 패키지(레빈, Levene)
library(car) #설치한 패키지 불러오기

by(SortMD2$q18, SortMD2$q14, mean) ##그룹별 표본평균 확인하기

leveneTest(SortMD2$q18, SortMD2$q14, center=mean) #Levene(레빈) 등분산 검정, 분산의 동질성  
#등분산 검정에서 (귀무가설 : 분산이 같다///대립가설 : 분산이 다르다)

t.test(SortMD2$q18~SortMD2$q14, conf.level=0.99, var.equal=FALSE)
##분석대상 변수~집단변수, 이분산일 경우, 양측검정

t.test(SortMD2$q18~SortMD2$q14, conf.level=0.99, var.equal=FALSE)














