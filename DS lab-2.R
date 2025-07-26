
#while loop
i <-1
while (i < 6) {
  print (i)
  i <- i + 1
}

i <-0
while (i < 6) {
  print(i)
  i <- i+1
 
}

#break
i <- 1
while (i < 6) {
  print(i)
  i <- i +1
  if (i == 4) {
    break
  }
}

#next
i <- 0
while (i < 6) {
  i <- i + 1
  if (i == 3) {
    next
  }
  print(i)
}



# for (var in sequence)
for (x in 1:10) {
  print(x)
}

  for (y in 4:30) {
    print(y)
  }


#for(nested)

for (x in 1:2) {
  for (y in 1:3) {
    print (x*y)
  }
}


#function
add_numbers<- function(a,b) {
  sum<- a+b
  
  return(sum)
}
print(add_numbers(4,5))


#vector
a <- c(1,2,5,3,6,-2,4)
b <- c("one", "two","three")
c <- c(TRUE,TRUE,TRUE,FALSE,FALSE,FALSE)
 print(a)
 print(b)
 print(c)
 
 name <- "hello world"
 nchar (name)
 
 x <- c(2,4,6,8)
 x + 2

#sort a vector
 X <- c(20,10,40,15)
 sort(X)
 
 Y <- c("B", "A", "D")
 sort(Y)
 
 numbers <- c(5, 2, 9, 1, 7)
 sorted_desc <- sort(numbers, decreasing = TRUE)
 print(sorted_desc)
 
 letter <- c("A", "D", "X", "Z")
 sorted_desc <- sort(letter, decreasing = TRUE)
 print(sorted_desc)
 
 #Access Vector
 S <- c(20,10,40,15)
 S[1]
 
 S <- c(20,10,40,15)
 S[1:4]
 
 S <- c(20,10,40,15)
 S[c(1,4)]
 
 #Matrices
 mymatrix <- matrix(1:20, nrow=5, ncol = 4)
 print(mymatrix)
 
 cells <- c(1:4)
 rnames <- c("R1", "R2")
 cnames <- c("C1", "C2")
 
 mymatrix <- matrix(cells, 
                    nrow = 2, 
                    ncol = 2, 
                    byrow = TRUE, 
                    dimnames = list(rnames, cnames))
 
 print(mymatrix)
 
 mymatrix[2][1]
mymatrix[1,3]
mymatrix[1,c(3,4)]

#Array
myarray <- array(1:24, c(2,3,2))
myarray

myarray <- array(1:50, c(3,4,2) )
myarray


#Data frames
patientID <- c(1,2,3,4)
age <- c(25,34,28,52)
diabetes <- c("Type1", "Type2", "Type1", "type1")
status <- c("poor", "Improve", "Excellent", "Poor")
patientdata <- data.frame(patientID, age, diabetes,status)
patientdata

patientdata[c("diabetes", "status")]

blood_group <- c("A+", "B-", "O+", "AB+")  # blood groups for existing rows
patientdata$blood_group <- blood_group

new_row <- data.frame(patientID = 5, age = 30, diabetes = "Type2", status = "Good", blood_group = "B+")
patientdata <- rbind(patientdata, new_row)

patientdata


#List
g <- "My First List"
h <- c(25,26,18,29)
j <- matrix(1:10, nrow=5)
k <- c("one", "two", "three")
mylist <- list(title=g, ages=h,j,k)
mylist

#user Input
var1 = readline(prompt = "Enter any value: ")
var2 = readline(prompt = "Enter any number: ")

var2 = as.integer(var2)
print(var1)
print(var2)