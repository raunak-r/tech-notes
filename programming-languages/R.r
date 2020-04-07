# Remember Basics ====

# Clearing the environment
rm(list = ls())

# Set the working directory
setwd()

# 1a.R as calculator - Example ====

# Addition
235+345

# Subtraction
11-6

# Multiplication
12*4

# Division
12/4

# Modulo division
13%%4

# Integer division
13%/%4

# Exponentiation
2^3

# 1b.R as calculator - Activity ====

# 1. Choose any number between 2 - 10
# 2. Multiply the given number by 2
# 3. Add 5 to the answer
# 4. Multiply the number by 50
# 5. If you have already celebrated birthday this year add 1769 elseadd 1768
# 6. Subtract the year you were born in

# Note: You can have multiple operations in single line in the following way:
# ((a +b)*c)

((((9*2)+5)*50)+1768)-1989

# 2a. Variable assignment - Example ====
# You can use any of the following ways to assign a variable in R
# '<-', '->', '='

# General convention is using '<-'
# Observe that the variable can now be found in the environment

apple <- 40
print(apple)
apple

# 2b. Variable assignment - Activity ====

# 1. Think of a number and assign it in a variable
# 2. Multiply the variable by 3
# 3. Add 6 to it
# 4. Divide it by 3
# 4. Subtract number from step-1 from output of step 4

# Note: Create new variables for each step

step1 = 4
step2 = step1 * 3
step3 = step2 + 6
step4 = step3 / 3
step5 = step4 - step1
print(step5)

# 3a. Atomic / Primary data types - Example ====
# R has the following data types
# 1. Numeric / Integer
# 2. Character
# 3. Logical

# Integer or numeric
mango <- 120
class(mango)

# Character- always in quotes (single or double)
quality <- 'Kesar'
class(quality)

# Logical
Fresh <- TRUE
class(Fresh)

# 3b. Atomic / Primary data types - Activity ====

# 1. What is the class of a variable 'pct' that has a value '100' in it?
# 2. What is the class of a variable 'miss' that has a value T in it?
# 3. What is the class of a variable 'days' that has a value 20 in it?

pct = '100'
class(pct)

miss = T
class(miss)

days = 20
class(20)

# 4a. Relational operators - Example ====
#Following are the realational operators that are available in R
# == checking for equality
# >= greater than or equal to
# <= less than or equal to
# < less than
# > greater than
# != not equal to

# Note: The output these operators is Logical i.e. whether the relation is True or False

'Wealth' == 'Happiness'

hours_spent_ofc = ((10*5)*22)*12
hours_spent_family = ((3*7)*30)*12
hours_spent_family >= hours_spent_ofc

time_spent_personal = ((2*7)*30)*12
time_spent_travel = ((4*5)*22)*12
time_spent_personal <= time_spent_travel

years_gone_by = 2019 - 1990
active_life = 65
bal_time = active_life - years_gone_by
years_gone_by < active_life

amt_spent_primary_education = 1.5 * 13
amt_spent_graduation = 2*4
amt_spent_graduation < amt_spent_primary_education

'worrying' != 'Happiness'

# 4b. Relational operators - Activity ====

# 1. Create a variable srh with value 6 in it
# 2. Create a variable csk with value 8 in it
# 3. Check if the difference between the variables is equal to 0
# 4. Check if csk is greater than srh
# 5. Add 3 to srh and check if it is less than csk
# 6. Add 2 to csk and 3 to srh and check if csk is greater than or equal to srh

# Note: Do not reassign while adding, it will change the original value

srh = 6
csk = 8

srh - csk == 0
csk > srh
srh+3 < csk
csk+2 >= srh+3

# 5a. Logical operators - Example ====
# "|" or "||" is "OR" operator "|" is vectorised while "||" is not
# "&" or "&&" is "AND" operator "&" is vectorised while "&&" is not
# "!" is NOT operator

A = TRUE
B = FALSE

A||B
A&&B
!A

# 5b. Logical operators - Activity ====

# 1. Create a variable b1 with a value F in it
# 2. Create a variable b2 with a value T in it
# 3. Use or operator between not of b1 , b2
# 4. Use and operator between not of b1 and not of b2
# 5. Use and operator between b1 and b2

b1 = F
b2 = T

!b1 || b2
!b1 && !b2
b1 && b2

# 6a. Complex constructs using logical and relational operators - Example ====

A=10
B=15

A==B || A<B
A==B && A<B
!(A==B || A<B) 

# 6b. Complex constructs using logical and relational operators - Activity ====

# 1. From the above example check the following two conditions using or operator
#     a. Add 3 to srh and check if it is greater than (csk+1)
#     b. Add 2 to srh and check if it is greater than (csk+1)

srh+3 > csk+1 || srh+2 >csk+1

# Secondary datatypes (Data Structures) in R ====

# Vectors: A vector is an object that consists of elements of same data type.
#          Lets see how to create a vector using a c function. c is a generic 
#          function that combines all its arguments.

# Matrices: These are arrays of two dimensions or more but we focus on 2d.
#           The data type for each of these elements should be same as in the 
#           case of vectors.

# Data Frames: Data in the form of a matrix (rows and columns).
#              The columns can be of different data types and type coersion 
#              doesn't happen.
#              This is important because the data we work on contain several 
#              attributes of different data types and it is  essential to preserve them.

# Lists: A list is datastructure that can store multiple data structures.

# 7a. Vectors - Creation and subset - Example ====

#Creating a numeric vector
A<- c(1,7,9)
A
class(A)

#Creating a character vector
A<-c("x1","x2","Target")
A
class(A)

#Creating a logical vector
A<-c(T,F,F,T)
A
class(A)

# If we want to create numbers in sequence we can use a ":" operator
A<-1:10
A

# A refined way to generating sequences
#seq is a function that takes parameters from, to, and by
A<-seq(1,20,by=2)
A

# Extracting elements from a vector
A<-c(1,11,33,22,7)

# Observe we are using square brackets for subset

A[3] #To find the 3rd element of a vector
A[1:4] #To find the 1st 4 elements of a vector

# 7b. Vectors - Creation and subset - Activity ====

# 1. Create a vector x1 with values (10, 'i', 24) & check the class of x1
# 2. Create a vector x2 with values ('i', 'j', TRUE) & check the class of x2
# 3. Create a vector x3 with values (TRUE, FALSE, 10, 11) & check the class of x3
# 4. Create a vector x4 with values ('i', 10, TRUE, 'False') & check the class of x4
# 5. Get the 2nd element of vector x1
# 6. Get the 2nd and 4th elements of vector x3
# 7. Get 1st to 3rd elements of vector x4

x1 = c(10, 'i', 24); class(x1)
x2 = c('i', 'j', TRUE); class(x2)
x3 = c(TRUE, FALSE, 10, 11); class(x3)
x4 = c('i', 10, TRUE, 'False'); class(x4)

x1[2]
x3[c(2,4)]
x4[1:3]

# 8a. Vectors - Applying logical and relational operators - Example ====

A<-c(1,17,14,7,4,-3,18,9,3.5, 2.8)
A>9
which(A>9)
A[which(A>9)]
A[A>9]

A<-seq(75,150,by=1)
A[A%%2==0] #Get elements divisible by 2
A[(A%%2==0) | (A%%3==0) ] #Get elements divisible by 2 or 3
A[(A%%5==0) & (A%%3==0)] #Get elements divisible by 5 and 3

# 8b. Vectors - Applying logical and relational operators - Activity ====

# 1. Create a vector srh with the elements ('L','L','W','W','W','L','W','W')
# 2. Find how many elements are there in srh and also number of 'W's
# 3. Create a vector csk with elements ('W','W','L','L','W','W','L','W')
# 4. Get the index numbers where srh and csk have 'W's and find how many are they

srh = c('L','L','W','W','W','L','W','W')
length(srh) #Length is used to find the number of elements in a vector
sum(srh == 'W'); length(which(srh=='W')); length(srh[srh=='W'])

csk = c('W','W','L','L','W','W','L','W')

which(srh== 'W')
which(csk == 'W')
which(csk == 'W' & srh == 'W')

# 9a. Vectors - Operations - Example ====

A = c(1:10)
B = c(11:20)

A+B
B-A
A*B
A/B

# 9b. Vectors - Operations - Activity ====

# 1. Create a vector x1 with sequence of numbers from 10 to 100 with step size 3
# 2. Create a vecor x2 with random numbers between 10 to 100 and the number of 
#    elements should be number of elements in x1
# 3. Add the elements of x1 and x2 and get the elements of x1 and x2 that are 
#    divisible by 5

# Note: To generate random numbers use sample('range','number_of_samples') function

x1 = seq(10,100,by=3)
x2 = sample(10:100,length(x1))

req_ix = which((x1+x2) %% 5 == 0)
x1[req_ix]
x2[req_ix]

# 10a. Matrices - Creation and subset - Example ====

# Matrix is a function to create a matrix. It has the following arguments - 
# what are the elements in the matrix
# how many rows in matrix / how many columns
# how should the filling of elements is done

A<-matrix(1:6,nrow=3,byrow = T)
A

A<-matrix(1:6,nrow=2,byrow = F)
A

A<-matrix(1:6,ncol = 2,byrow = T)
A

A<-matrix(1:6,ncol = 3,byrow = T)
A

# To get the 2nd element
A[2]
c(A) #To check how the elements are arranged

# To get second element of first row
# In the square braces, left of comma belongs to rows and 
# right of comma represents columns
A[1,2] 

#To extract the second row
A[2,]

#To extract the second column
A[,2]

#We can also label the rows and columns of a matrix using the function dimnames
dimnames(A)<-list(c("R1","R2","R3"),c("C1","C2"))
A

# 10b. Matrices - Creation and subset - Activity ====

# 1. Create a 'm1' matrix with 16 elements from a sequence of randomly generated numbers
#    between 1:100
# 2. Extract all the rows of matrix 'm1' where the 'column 2' values are divisible by '2'

# Note arrange the elements by rows and the matrix should have 4 columns

m1 = matrix(sample(1:100,16),ncol = 4,byrow = T)
m1
m1[m1[,2]%%2 == 0,]

# 11a. Matrices - Operations - Example ====

#"+" addition
#"-" subtraction
#"*" is element wise multiplication
#"%*%" is matrix multiplication

m1 = matrix(1:6,nrow = 2,byrow = T)
m2 = matrix(1:6,nrow = 2,byrow = F)
m3 = matrix(1:6,nrow = 3,byrow = T)

m1
m2
m1 + m2
m1 - m2
m1 * m2
m1 %*% m3

# 11b. Matrices - Operations - Activity ====

# 1. Create a matrix m1 with elements first 9 odd numbers arranged row wise in 3 rows
# 2. Create a matrix m2 with elements first 9 even numbers arranged row wise in 3 rows
# 3. Add the matrices m1 and m2 and extract the rows where the values of 1st column 
#    are divisible by 5
# 4. Divide the Matrix from above resultant matrix's 3rd column values by 2 and 
#    replace the orig values
# 5. Find the transpose of matrix m2 and multiply with the matrix in step 4

# Note: Use t(matrix) to find the transpose of the matrix

req_numbers = 1:100
even_num = req_numbers[req_numbers %% 2==0]
even_num = even_num[1:9]

odd_num = req_numbers[req_numbers %% 2 !=0]
odd_num = odd_num[1:9]

m1 = matrix(even_num,byrow = T,nrow = 3)
m2 = matrix(odd_num,byrow = T,nrow = 3)

add_res = m1+m2
add_res[add_res[,1] %% 5 ==0,]

add_res[,3] = add_res[,3] / 2

add_res * t(m2)

# 12a. Matrices - Frequently used functions - Example ====

#Lets create two vectors and bind them to create matrix
A<-1:5
B<-6:10

cbind(A,B) # cbind to bind the matrices/data frames by columns
rbind(A,B) # rbind to bind the matrices/data frames by rows

# 12b. Matrices - Frequently used functions - Activity ====

# 1. Using cbind create a matrix 'm1' with even and odd numbers from the above experiment
# 2. Using rbind create a matrix 'm2' with even and odd numbers from the above experiment
# 3. From the matrix 'm2' find the column numbers of elements from 2nd row divisible by 5
#   and subset all the rows and resultant columns

m1 = cbind(even_num,odd_num)

m2 = rbind(even_num,odd_num)
m2[,which(m2["odd_num",] %% 5 == 0)]

# 13a. Data frames - Creation and subset - Example ====

# Creating a data frame
A<-c(10,20,30,40)
B<-c("Alpha","Beta","Gamma","Delta")
C<-c(T,T,F,F)

DF<-data.frame(A,B,C)
DF

# To access the elements of 2nd column
DF[,2]

# To access the elements of column 'C'
DF$C

# To access the 2nd and 4th rows of columns 1 & 3
DF[c(2,4),c(1,3)]


# 13b. Data frames - Creation and subset - Activity ====

# 1. Create a vector age with values (10,14,12,15,13)
# 2. Create a vector gender with values ('M','F','F','M','M')
# 3. Create a vector group with values ('low','mid','mid','high','mid')
# 4. Create a dataframe df1 with columns age, gender and group
# 5. Get the records where gender is 'F'
# 6. Get the details of column 'group' where the age values is greater than 10 and less than 15

age = c(10,14,12,15,13)
gender = c('M','F','F','M','M')
group = c('low','mid','mid','high','mid')

df1 = data.frame(age,gender,group)

df1[df1$gender == 'F',]
df1[df1$age > 10 & df1$age <15,'group']

# 14a. Data frames - Frequently used functions - Example ====

#We have a dataframe DF and we want to know the dimensions of it
dim(DF)

#To get the number of rows and number of columns of DF-nrow and ncol respectively
nrow(DF)
ncol(DF)

## To understand the structure of dataframe
str(DF)

#To look into the summary of the dataframe
summary(DF)

#To access a column by name we use "$"
DF$A 

#The functions str, summary also work on individual columns
str(DF$A)




# 14b. Data frames - Frequently used functions - Activity ====

# 1. Get the column values of gender and group where the age is minimum in df1
# 2. Find the number of unique elements in group and gender columns of df1
# 3. Find the number of rows where the gender is F
# 4. Find the ages of records where the gender is M and group is high

df1[df1$age == min(df1$age),c('gender','group')]
df1[which.min(df1$age),c('gender','group')]

length(unique(df1$gender))
length(unique(df1$group))

nrow(df1[df1$gender == 'F',])

df1[df1$gender == 'M' & df1$group == 'high','age']

# 15a. Lists - Creation and access - Example ====

val=c(1,7,9)
ch=c("A","X","Z")
A<-list(val,ch,data.frame(val,ch),list(val,ch))

# To get the first element of the list which is val. But we know that val has 3 elements in it
A[1]

# To get the first element of the val
A[[1]][1] 

# Since the third element of the list is a dataframe we can access the elements 
# of the dataframe using $

A[[3]]$ch

# Elements of list can also be accessed using names if they have
B=list(M=val,N=ch,O=data.frame(val,ch),P=list(val,ch))
B$O[[1]]

#To unlist the elements
unlst<-unlist(B)
unlst

# 15b. Lists - Creation and access - Activity ====

# 1. Create a list l1 with matrix m3, df1 and age
# 2. Find the length of list l1 and type of each element
# Note use class(object) to find the type / class of object
# 3. Get the elements of 2nd row from the data frame in the list

l1 = list(m3,df1,age)

length(l1)
class(l1[1])
class(l1[[1]]);class(l1[[2]]);class(l1[[3]])

l1[[2]][2,]

# 16a. Conditional statements and loops - Example ====

# ifelse statement

df = mtcars

# Create a new variable 'condition' in df taking the values from the following condition
# if mileage is less than 25 "Bad" else "Good"

df$condition = ifelse(df$mpg>25,'Good','Bad')

# Ifelse can be nested
# mpg>25 is good, mpg>18 is ok and mpg<18 is bad

df$condition<-ifelse(df$mpg>25,"Good",ifelse(df$mpg>18,"OK","Bad"))


# If we had to do this using a loop

for(i in 1:nrow(df)){
  if(df$mpg[i]>25){
    df$condition[i]<-"Good"
  }
  else{
    df$condition[i]<-"Bad"
  }
}

for(i in 1:nrow(df)){
  if(df$mpg[i]>25){
    df$condition[i]<-"Good"
  }
  else 
    if(df$mpg[i]>18){
      df$condition[i]<-"OK"
    }
  else{
    df$condition[i]<-"Bad"
  }
}

# While loop
i = 1
while (i < 6){
  print(i)
  i = i+1
}

# next and break statements
# break
x = 1:5
for (val in x) {
  if (val == 3){
    break
  }
  print(val)
}

# next
for (val in x) {
  if (val == 3){
    next
  }
  print(val)
}

# 16b. Conditional statements and loops - Activity ====


# 1. Use for loop and print the class of all the element of the list l1
# 2. In the above loop add a step to print the dimenssions if the class is data.frame
# 3. In the above loop add functionality to print dim if it's matrix / data.frame and length for others

# Loop 1:
for (i in 1: length(l1)){
  print(class(l1[[i]]))
}

# Loop 2:
for (i in 1: length(l1)){
  print(class(l1[[i]]))
  
  if(class(l1[[i]]) == 'data.frame'){print(dim(l1[[i]]))}
}

# Loop 3:
for (i in 1: length(l1)){
  print(class(l1[[i]]))
  
  if(class(l1[[i]]) == 'data.frame' | class(l1[[i]]) == 'matrix'){
    print(dim(l1[[i]]))}else{print(length(l1[[i]]))}
}

# 17a. Apply functions family - Example ====

# The "Apply" family
# Used to manipulate slices of data in a repetitive way

# apply:
# Syntax apply(on what, by row or by column, what function to be applied)

# tapply:
# We have a data that can be divided into groups
# On each of this group we want to apply the function and want to get a table as output.
# We use tapply

# sapply and lapply:
# Both work in a similar way, traverse over a vector or list and calling the function 
# for each item except that sapply simplifies the output

df_num <-df[c(1,3:6)]

# Lets say in the num_DF, we need to find mean value for each of the columns. 
# This is a repetitive process that can be quickly done by apply

apply(df_num,2,mean)

# Although it is not meaningful in this case, if we want to take mean of each row

apply(df_num,1,mean)

# Lets us consider mpg and cyl of DF data, we want to find the mean mileage for each of the group.

tapply(df$mpg,df$cyl,FUN=mean)

sapply(df_num,mean)

lapply(df_num,mean)

sapply(df_num,mean,simplify = F)

# 17b. Apply functions family - Activity ====

# 1. Using apply function to find the number of unique values in each column of df
# Note: to use multiple functions inside apply function use the following syntax
# apply(dataframe,rowwise / columnwise,function(x) f1(f2(x)))
# 2. Find class of each element of list l1 using sapply function

apply(df1,2,function(x) length(unique(x)))

sapply(l1,class)

# 18a. Custom functions - Example ====

# Lets create a simple functions to check if a number is even or odd

even_odd<-function(x){
  if(x%%2==0){
    return("even")
  }
  else{
    return("odd")
  }
}

even_odd(20)

# 18b. Custom functions - Activity ====

# 1. Write a custom function col_summary that will take data frame as input and itterate 
#    over columns and do the following
#    If the column is numeric print the column name, min, max, mean values
#    If the column is factor print the column name, number of unique levels
#    If the column is neither numeric / factor return just the column name and type of column

# Note: Ask for the required functions / syntax

col_summary = function(df_req){
  for(i in colnames(df_req)){
    
    if(class(df_req[,i]) == 'numeric'){
      
      col = df_req[,i]
      col_min = min(col)
      col_max = max(col)
      col_mean = mean(col)
      
      print(c(column_name = i, 
              min = col_min, max = col_max, mean = col_mean))
    }else if (class(df_req[,i]) == 'factor'){
      
      col = df_req[,i]
      col_uni_len = length(unique(col))
      
      print(c(column_name = i, 
              n_levels = col_uni_len))
    }else{
      
      column_name = i
      print(c(column_name = column_name, 
                  col_type = class(df_req[,i])))}
  }
}

col_summary(df_req = df)

# 19a. Working with factors - Example ====

# Factors have levels
# Factors are created when we read non-numerical columns 
# into a data frame.

x <- factor(c("A","B","C","A"))
str(x) #Observe that individual elements are stored as numbers


A<-c(1,2,3,4,5)
B<-factor(c("A","A","B","C","B"))
A
B

A[5]<-1000
A

B[5]<-"Alpha"

B

# How to modify a factor
levels(B)<-c(levels(B),"Alpha")
B[5]<-"Alpha"
B

# 19b. Working with factors - Activity ====

# 1. Create a factor vector with levels "A","B","C" with 20 elements
# 2. All the elements with level B are to be converted to "Beta"

X<-factor(sample(c("A","B","C"),20,replace = T))
X

levels(X)[levels(X)=="B"]<-"Beta"
X

# 20a. Merge / Join operations - Example ====

# Using merge operation
x = data.frame("K" = c("a","b") ,
               "V1" = c(1,2))

y = data.frame("K" = c("b","c") ,
               "V2" = c(1,2))
x;y

# To get all unique value of matching column
merge(x,y,by = "K",all =T)

# To get only matched values of matching column
merge(x,y,by = "K",all =F) 

# To get all matched and un-matched x values of matching column
merge(x,y,by = "K",all.x =T)

# To get all matched and un-matched y values of matching column
merge(x,y,by = "K",all.y =T)

# Using join operation
library(dplyr)

df1 = data.frame(CustomerId = c(1:6), Product = c(rep("Toaster", 3), rep("Radio", 3)))
df2 = data.frame(CustomerId = c(2, 4, 6,7), State = c(rep("Alabama", 2), rep("Ohio", 1),"NewYork"))

df1; df2

# To get all unique value of matching column
full_join(df1,df2,by="CustomerId")

df1 %>% full_join(df2,by="CustomerId")

# To get only matched values of matching column
df1 %>% inner_join(df2, by = "CustomerId")

# To get all matched and un-matched df1 values of matching column
df1 %>% left_join(df2,by = "CustomerId")

# To get all matched and un-matched df2 values of matching column
df1 %>% right_join(df2,by="CustomerId")

# 20b. Merge / Join operations - Activity ====

df1 <- data.frame(id1 = c(11, 12, 13, 14), 
                  id2 = c(21, 22, 23, 24), 
                  c11 = c(1, 2, 3, 4), 
                  c12 = c("a", "b", "c", "d"))

df2 <- data.frame(id1 = c(99, 12, 13, 14), 
                  id2 = c(98, 22, 23, 24), 
                  c21 = c(5, 6, 7, 8), 
                  c22 = c("e", "f", "g", "h"))

df3 <- data.frame(id1 = c(998, 9998, 23, 24), 
                  id2 = c(999, 9999, 13, 14), 
                  c31 = c(9, 10, 11, 12), 
                  c32 = c("i", "j", "k", "l"))

# Using the given dataframes do the following operations

# 1. Merge df1 & df2 on 'id1' and find number of 
#    un matched rows from df1 and find the values of 'id1'
#    which did not match
# Note: Use the following example for 2nd part of question
# 2. Join df3 with df1 matching 'id1' in df3 and 'id2' in df1
#    Get all matched and un matched values from df3
a = c(11,12,13,14)
b = c(12,13,14)
a[!a%in%b]

merge1 = merge(df1,df2,by='id1')
nrow(df1) - nrow(merge1)
df1[!(df1$id1 %in% merge1$id1),'id1']

left_join(df3,df1,by=c('id1' = 'id2'))

# 21a. Aggregate operations - Example ====

# Loading inbuild baseball data
data <- baseball

# Get sum of rbi (runs batted in) per team 

# Method 1:
aggregate(data$rbi,by=list(data$team),FUN=sum,na.rm=T)

# Method 2:
datatmp <- data %>% 
  group_by(team) %>% 
  summarise(runs=sum(rbi,na.rm=T))

datatmp
datatmp = data.frame(datatmp)

# Method 3:
tapply(data$rbi,data$team,FUN=sum,na.rm=T)

# 21b. Aggregate operations - Activity ====

# 1. Using the above data find the mean 'rbi' per stint in each year
#    and also find the count of each stints per year as well

data %>% group_by(year,stint) %>% summarise(mean_runs = mean(rbi,na.rm=T),
                                            count_stint = length(stint))

# 22a. Reshape operations - Example ====

library(tidyr)

messy <- data.frame(
  name = c("Wilbur", "Petunia", "Gregory"),
  a = c(67, 80, 64),
  b = c(56, 90, 50)
)
messy

# We have three variables (name, drug and heartrate), 
# but only name is currently in a column. We use gather() 
# to gather the a and b columns into key-value pairs of drug 
# and heartrate:

gather_df = messy %>% gather(drug, heartrate, a:b)
gather_df

# If we want to get back to the original data

spread_df = gather_df %>% spread(drug,heartrate)

# Using the melt and cast functions for same tasks
library(reshape2)

# Similar to gather functionality
melt(messy,id=('name'),variable.name ='drug',
     value.name = 'heartrate')

# Similar to spread functionality
dcast(gather_df,name~drug)

# 22b. Reshape operations - Activity ====

df1 = data.frame(id = c(1,1,2,2),
                 time = c(1,2,1,2),
                 x1 = c(5,3,6,2),
                 x2 = c(6,5,1,4))
df1

# 1. From the given data frame, reshape the df1 to have id and time
#    as keys and rest of columns as values with name 'ht', variable name 
#   should be x
#    Do the same using tidyr and reshape using dplyr
# 2. use the melted df from above step and bring it back to original shape
#    Do the same using tidyr (dplyr) and reshape

gather(df1,x,ht,x1:x2)
melt_df = df1 %>% melt(id=c('id','time'),variable.name ='x',value.name = 'ht')

dcast(melt_df,id+time~x)
melt_df %>% spread(x,ht)

# 23a. Regular expressions - Example ====

strsplit(x = 'bharath_narla',split = '_')

txt2 <- "useRs may fly into JFK or laGuardia"
gsub(pattern = 'Fly',replacement = 'replaced_fly',
     x = txt2,ignore.case = T)

det <- c("A1","A2","A3","A4","A5","A6","A7") 
grep(pattern = "A1|A4",x = det,value =T) 
grepl(pattern = "A1|A4",x = det) 

# 23b. Regular expressions - Activity ====

df1 = data.frame(id = c(1,2,3,4,5),
                 email = c("warner@srh.com",
                           "baristow@srh.com",
                           "gayle@kxp.com",
                           "rahul@kxp.com",
                           "ABD@rcb.com"))

df1

# 1. From the given data frame split the email id into two columns and
#   create two new columns name and team
# 2. Get the cols where 'srh' is in team name
# 3. Substitute '.com' with blanks in team column


cbind(df1,do.call(rbind,str_split(df1$email,"@")))
df1$name = apply(df1["email"],1,function(x) str_split(x,"@")[[1]][1])
df1$team = apply(df1["email"],1,function(x) str_split(x,"@")[[1]][2])
df1

df1[grepl('srh',df1$team),]
df1$team = gsub('.com','',df1$team)
df1


# 24. Parallelism (foreach, doparallel) - Demo ====
#install.packages('doParallel')
library(doParallel)

# This function generates a square matrix of uniformly 
# distributed random numbers, finds the corresponding (complex)
# eigenvalues and then selects the eigenvalue with the largest
# modulus. The dimensions of the matrix and the standard 
# deviation of the random numbers are given as input parameters.

max.eig <- function(N, sigma) {
  d <- matrix(rnorm(N**2, sd = sigma), nrow = N)
  E <- eigen(d)$values
  abs(E)[[1]]
}

# Do the same task multiple times
times(10) %do% max.eig(5, 1)

# To pass different parameters for each iteration
foreach(n = 1:5) %do% max.eig(n, 1)

# To combine results into a vector
foreach(n = 1:5, .combine = c) %do% max.eig(n, 1)

# To use nested foreach
foreach(n = 1:5) %:% foreach(m = 1:3) %do% max.eig(n, m)

# To combine results using rbind
foreach(n = 1:5, .combine = rbind) %:% foreach(m = 1:3) %do% max.eig(n, m)

# To combine results using cbind
foreach(n = 1:5, .combine = cbind) %:% foreach(m = 1:3) %do% max.eig(n, m)

# To combine results using custom function
merge.by.time <- function(a, b) {
  merge(a, b, by='timestamp', suffixes=c('', ncol(a)))
}

results = foreach(i=1:5, .combine=merge.by.time) %do% {
  data.frame(timestamp=sample(1:10), feature=rnorm(10))
}

results

#Note: Did you observe we only used 'do' we will now look at 'dopar'

library(doParallel)

# Intro to 'do' and 'dopar'
system.time(foreach(i=1:10000) %do% sum(tanh(1:i)))
system.time(foreach(i=1:10000) %dopar% sum(tanh(1:i)))
# Note: warnings is indicating that dopar is not doing tasks in
# parallel, register cores to pallelise the tasks

# Registering cores
registerDoParallel()
getDoParWorkers()
system.time(foreach(i=1:10000) %do% sum(tanh(1:i)))
system.time(foreach(i=1:10000) %dopar% sum(tanh(1:i)))

# Moving back to sequential
registerDoSEQ()
getDoParWorkers()
system.time(foreach(i=1:10000) %do% sum(tanh(1:i)))
system.time(foreach(i=1:10000) %dopar% sum(tanh(1:i)))

# Using max cores
detectCores()
registerDoParallel(cores=4)
getDoParWorkers()
system.time(foreach(i=1:10000) %do% sum(tanh(1:i)))
system.time(foreach(i=1:10000) %dopar% sum(tanh(1:i)))

# Overhead problems when using more cores than available
registerDoParallel(cores=300)
getDoParWorkers()
system.time(foreach(i=1:10000) %do% sum(tanh(1:i)))
system.time(foreach(i=1:10000) %dopar% sum(tanh(1:i)))

# 25a. Data pre processing Example ====
# 1. Read the data and exploration
# 2. Train & test split
# 3. Data type conversion
# 4. Handling NA
# 5. Binning
# 6. Standardization / Normalization
# 7. Creating dummies

# 1. Read the data and exploration ====

cust_data = read.csv('CustomerLoanData.csv')

dim(cust_data)
colnames(cust_data)
summary(cust_data)
str(cust_data)

# 2. Train & test split ====

# Method 1: Using row sampling
set.seed(1234)
rows<-1:nrow(cust_data) # to get the number of rows

# To get the indecies of rows that need to go into train
trainrows<-sample(rows,0.7*nrow(cust_data)) 

# Subset the required row indecies to get train data
train<-cust_data[trainrows,]

# Subset by excluding the train rows to get test data
test<-cust_data[-trainrows,]

# Method 2: Using 'catools'
library(caTools)
set.seed(123) 
sample_rows = sample.split(cust_data$ccAvg, SplitRatio = .70)
train = subset(cust_data, sample_rows == TRUE)
test = subset(cust_data, sample_rows == FALSE)

# Method 3: Using 'caret'
library(caret)
set.seed(123)
sample_rows = createDataPartition(cust_data$ccAvg,p=0.7,list = F)
train = cust_data[sample_rows,]
test = cust_data[-sample_rows,]

# 3. Data type conversion ====
colnames(train)

cat_cols = c("edu","securities","cd","online","cc","infoReq","loan")
num_cols = colnames(train)
num_cols = num_cols[!num_cols%in%cat_cols]

# If you want it to do individually
train$edu = as.factor(train$edu)

# IF you want to do multiple columns at once

train[,cat_cols] = data.frame(sapply(train[,cat_cols],as.factor))
train[,num_cols] = data.frame(sapply(train[,num_cols],as.numeric))

# 4. Handling NA ====

# Check for number of NA in train data frame
sum(is.na(train))

# To find number of NA in each column
sapply(train,function(x) sum(is.na(x)))

# Option 1: To remove all rows with at least one NA
nrow(train)
head(na.omit(train)) 
nrow(na.omit(train))

# Option 2: Central Imputation
library(DMwR)
sum(is.na(train))
train_ci = centralImputation(train)
sum(is.na(train_ci))

# Option 3: KNN Imputation
sum(is.na(train))
train_knn = centralImputation(train)
sum(is.na(train_knn))

# 5. Binning ====

# Option 1:
library(infotheo)
train$cat_cc <- as.factor(discretize(train$ccAvg, disc="equalfreq",nbins=2))
train$cat_cc <- as.factor(discretize(train$ccAvg, disc="equalwidth",nbins=2))


# Option 2:
median_cc = median(train$ccAvg,na.rm = T)
train$cat_cc = ifelse(train$ccAvg < median_cc,'low','high')

# 6. Standardization / Normalization ====

library(vegan)

# Using range method:
summary(train_ci[,num_cols])
train_ci[,num_cols] = decostand(train_ci[,num_cols],"range")
summary(train_ci[,num_cols])

# Using Z-score method:
summary(train_knn[,num_cols])
train_knn[,num_cols] = decostand(train_knn[,num_cols],"standardize")
summary(train_knn[,num_cols])

# 7. Creating dummies ====
library(dummies)
dim(train_knn)
train_knn = dummy.data.frame(train_knn,names = cat_cols)
dim(train_knn)

# 25b.Data preprocessing Activity ====

# 1. Read the data 'train.csv'
# 2. Do the folowing pre processing steps on train:
#    1. Split the data into train and test
#    2. Understand the train data
#    3. Find the un wanted columns and remove them from train
#    4. Identify the column types and convert them appropriately
#    5. Handle the unknown levels in some of the columns
#    6. Using preprocess function impute and standardize the train data
#    7. Write a function to do mode imputation on train and test
# 3. Do the following preprocessing on test data:
#    1. Keeping only the required columns
#    2. Convert the data types
#    3. Handling the levels of factor columns
#    4. Handling missing values and standardization
# 4. Imputing categorical columns of train and test
# 5. Creating dummy variables for train and test

# 1. Read the data ====
rm(list = ls())
cab_data = read.csv('train.csv')

# 2. Preprocessing steps - Train ====

# 1. Train test split
library(caret)
set.seed(123)
sample_rows = createDataPartition(cab_data$fare_amount,p=0.7,list = F)
train = cab_data[sample_rows,]
test = cab_data[-sample_rows,]

# 2. Understand the data
dim(train)
colnames(train)
str(train)
summary(train)

# 3. Find the un wanted columns and remove them from train
cols_drop = c('TID','pickup_datetime','dropoff_datetime',
              'pickup_longitude','pickup_latitude',
              'dropoff_longitude', 'dropoff_latitude')

req_cols = colnames(train)
req_cols = req_cols[!req_cols %in% cols_drop]
train = train[,req_cols]
colnames(train)

# 4. Identify the column types and conver them appropriately
cat_cols = c("vendor_id","new_user","store_and_fwd_flag","payment_type")
num_cols = colnames(train)
num_cols = num_cols[!num_cols%in%cat_cols]

train[,cat_cols] = data.frame(sapply(train[,cat_cols],as.factor))
train[,num_cols] = data.frame(sapply(train[,num_cols],as.numeric))

# 5. Handle the unknown levels in some of the columns
sapply(train[,cat_cols],levels)

levels(train$new_user)[levels(train$new_user) == ""] = NA
levels(train$store_and_fwd_flag)[levels(train$store_and_fwd_flag) == ""] = NA 

# 6. Using preprocess function impute and standardize the train data
library(caret)
train_preprocess = preProcess(train,method = c('medianImpute','scale'))
sum(is.na(train))
train_preprocessed = predict(train_preprocess,train)
sum(is.na(train_preprocessed))

# 7. Write a function to do mode imputation on train and test
mode_impute = function(train_df,test_df){
  for(i in colnames(train_df)){
    req_col = train_df[,i]
    mode_val = names(which.max(table(req_col)))
    req_col[is.na(req_col)] = mode_val
    train_df[,i] = req_col
    test_df[is.na(test_df[,i]),i] = mode_val
  }
  return(list(train = train_df,test = test_df))
}

# 3. Test data preprocessing====

# 1. Keeping only the required columns
test = test[,req_cols]

# 2. Converting the data types
test[,cat_cols] = data.frame(sapply(test[,cat_cols],as.factor))
test[,num_cols] = data.frame(sapply(test[,num_cols],as.numeric))

# 3. Handling the levels of factor columns
levels(test$new_user)[levels(test$new_user) == ""] = NA
levels(test$store_and_fwd_flag)[levels(test$store_and_fwd_flag) == ""] = NA 

# 4. Handling missing values and standardization
sum(is.na(test))
test = predict(train_preprocess,test)
sum(is.na(test))

# 4. Imputing categorical columns of train and test ====

imputed_output = mode_impute(train_df = train,
                             test_df = test)

train = imputed_output$train
test = imputed_output$test

sum(is.na(train))
sum(is.na(test))

# 5. Creating dummy variables for train and test ====

train = dummy.data.frame(train,names = cat_cols)
test = dummy.data.frame(test,names = cat_cols)

train_cols = colnames(train)
test_cols = colnames(test)

train_cols[!train_cols%in%test_cols]
test_cols[!test_cols%in%train_cols]

# 26. R - SQL Demo ====

library(RMySQL)

# 1. Connecting to the database
mydb = dbConnect(MySQL(), 
                 user='admin', 
                 password='password', 
                 dbname='Uber', 
                 host='')

# 2. To get the list of tables from the connection
dbListTables(mydb)

# 3. To check the column names of the required table
dbListFields(mydb, 'SampleData')

# 4. To get the required table
fetchQuery = dbSendQuery(mydb, "select * from SampleData")
mysqlData = fetch(fetchQuery)

dim(mysqlData)
str(mysqlData)

# To send a query with subset condition
fetchQueryNew = dbSendQuery(mydb, 
                            "select * from SampleData where Age > 30")
mysqlDataNew = fetch(fetchQueryNew)
mysqlDataNew

# 5. To write a table into datbase
dbWriteTable(mydb, 
             "SampleDataNew", 
             mysqlDataNew, 
             overwrite = TRUE)


# 6. Disconnect from the data base
dbDisconnect(mydb)
