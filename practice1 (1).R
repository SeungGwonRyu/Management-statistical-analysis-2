##start##Hello World 출력
firstinR <- c(1,2,3)
firstinR

firstinR2=c(1, 2, 3) #<-와 =은 같은 역할을 합니다. 괄호안의 띄어쓰기는 출력 결과에 영향을 미치지 않습니다.
firstinR2

print("Hello World!")

"Hello World!"


##변수 선언 
var1 <- "Hyunji Park" # var1 변수에 문자열 본인 이름 입력
var1

var2 = c(0,1,2,3,4,5,6,7,8,9)
var2

var3 <- c("Hyun",'ji',"Park") # var3 변수에 문자열 여러개 입력
var3
print(var3)

박현지 <- 1
박현지
print(박현지)


##변수를 이용한 산술 연산
num1 <- 1
num2 <- 2
num1 + num2 #산술연산자 + 사용


## 변수 삭제
rm(var1)
rm(var2)
rm(var3)
rm(list=ls()) #모든 변수 삭제



##Vector 
c(1,2,3,4,5) #숫자형 1,2,3,4,5가 포함된 벡터 생성

c("박", "현", "지") #문자열 박, 현, 지 포함된 벡터 생성


vec1 <- c(1:10) # 1부터 10까지의 숫자형이 포함된 벡터를 생성하고 vec1 변수로 선언
vec2 <- c(11:20) #11부터 20까지의 숫자형이 포함된 벡터를 생성하고 vec2 변수로 선언

vec1 #vec1에 속한 값 보여주기

vec2 #vec2에 속한 값 보여주기

vec1[3] #vec1에 속한 값 가운데 3번째 값만 보여주기

vec1[-3] #vec1에 속한 값 가운데 3번째 값만 빼고 보여주기

vec1[-1:-4] #vec1에 속한 값 가운데 1번째~4번째 값을 빼고 보여주기
vec1

vec1[2] <- 6 #vec1에 속한 값 가운데 2번째 값을 6으로 변경

vec1[15] <- 15 #vec1에 속한 값 가운데 15번째 값을 15로 변경

vec1

##Vector 간 연산 
vec3 <-c(1,2,3)

vec4 <-c(4,5,6)

vec1 + vec3 #vector1과 vector3을 더함

vec3 + vec4 #vector3과 vector4를 더함


#vector flexible

vec5 <- c(1,2,3,"박현지") 


#matrix
mat1 <- matrix(c(1,2,3,4)) # 1,2,3,4가 포함된 매트릭스를 생성
mat1

mat2 <- matrix(c(1,2,3,4))
mat2 <- matrix(c(1,2,3,4), nrow=2) #1,2,3,4가 포함된 매트릭스를 2행으로 생성
mat2

mat2[1,1] #mat2의 1행 1열 값 출력

mat2[,1] #mat2의 모든 행의 1열 값 출력

mat2[1,] #mat2의 1행의 모든 값 출력


colnames(mat2) <- c("first", "second")
mat2

mat3 <- rbind(mat2,c(9,9)) #mat2의 마지막 행에 9,9를 입력하고 변수명 mat3으로 선언
mat3

mat3 <- cbind(mat3, c(8,8,8)) #mat3마지막 열에 8,8,8을 입력하고 변수명 mat3으로 선언
mat3

colnames(mat3) <- c("first", "second", "third") ##mat3마지막 열 이름 붙여주기
mat3


##array
#array(
#data=NA,           #데이터를 저장하는 vector입력
#dim(length(data))  #array의 차원, 값을 지정하지 않으면 1차원 array가 생성됨
#dimnames = NULL    #array 차원의 이름 입력, 기본값은 NULL
#)


ar1 <- array(1:12, dim=c(3,4)) #1부터 12까지의 값을 이용해 3X4의 array를 생성하고 ar1으로 저장
ar1

ar2 <- array(1:12, dim=c(2,2,3)) #1부터 12까지의 값을 이용해 2X2X3의 array를 생성하고 ar2로 저장
ar2


##list
#list를 생성하고 변수명 list1으로 저장, 단 조건은
list1 <- list(name="박현지", #name key의 값은 박현지
              Sex="female", #sex key의 값은 female
              StudentNumber=2005051531, #StudentNumber key의 값은 2005051531
              Address="ansan", #address key의 값은 ansan
              Phone='031-400-5038', #C.P key의 값은 031-400-5038
              Email='hyungee84@hanyang.ac.kr' #email key의 값은 hyungee84@hanyang.ac.kr
)

list1


##data.frame
#벡터로부터 데이터프레임 생성

no <- c(1,2,3,4) #no 값 입력

name <- c("apple", "peach", "banana", "grape") #name값 입력

price <- c(500, 200, 100, 50) #price값입력

Qty <- c(5,2,4,7) #Qty값 입력

no
name


sales <- data.frame(No=no,NAME=name,PRICE=price,QTY=Qty) 
#no, name, price, Qty변수의 vector를 이용해 dataframe을 만들고 sales라는 변수명으로 선언
sales


str(sales) #sales의 내부 구조 확인

