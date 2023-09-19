firstinR <- c (1, 2, 3 )
firstinR
print("Hello World!")


##변수 선언
var1 <- "Seung Gwon Ryu" ##var1 변수에 문자열 본인 이름 입력
var1

var2 = c(0,1,2,3,4,5,6,7,8,9)
var2

var3 <- c("Seung",'Gwon',"Ryu") ##var3 변수에 문자열 여러개 입력
var3
print(var3)

류승권 <- 1
류승권
print(류승권)


##변수를 이용한 산술 연산
num1 <- 1
num2 <- 2
num1 + num2 #산술연산자 + 사용

## 변수 삭제
rm(var1)
rm(var2)
rm(var3)
rm(list=ls()) #모든 변수 삭제


##data.frame
#벡터로부터 데이터프레임 생성 행과 열로 구성 이것이 데이터 프레임

no <-c(1,2,3,4) #no 값 입력
name <-c("apple","peach","banana","grape") #name 값 입력
price <-c(500,200,100,50) #price 값 입력
Qty <- c(5,2,4,7) #Qty 입력
no
name

##행과 열로 만들기

sales <- data.frame(NO=no,NAME=name,PRICE=price,QTY=Qty)
sales

