# Predictive analytics using R
#Cancer diagnosis using human cell data
getwd()
# WISCONS in Breast cancer data analysis using K-NN----
# LOAD the  Data set & assign dataframe to cancer_data

cancer_data = read.csv("cancer.txt",stringsAsFactors = FALSE)

# Find the strcture of data set
str(cancer_data)
dim(cancer_data)
#Univariate DESCRITIVE analysis of the variables
# summarise data set using summary  statistic 
summary(cancer_data)

# Start preparing predictive analytics,gives names to the columns
dim((cancer_data))
names(cancer_data)

# gives the name

#  Attribute                     Domain
-- -----------------------------------------
#1. Sample code number            id number
#2. Clump Thickness               1 - 10
#3. Uniformity of Cell Size       1 - 10
#4. Uniformity of Cell Shape      1 - 10
#5. Marginal Adhesion             1 - 10
#6. Single Epithelial Cell Size   1 - 10
#7. Bare Nuclei                   1 - 10
#8. Bland Chromatin               1 - 10
#9. Normal Nucleoli               1 - 10
#10. Mitoses                       1 - 10
#11. Class:                        (2 for benign, 4 for malignant)

names(cancer_data)= c("samplecode","clumpT","Cellsize","cellshape",
                      "M_A","EpithelialCellSize","BareNuclei",
                      "BlandChromatin","NormalNucleoli","Mitoses","Class")
names(cancer_data)
# Exclude the attributes which are not needed
cancer_data$samplecode = NULL
names(cancer_data)
#Data cleaning step 1
str(cancer_data)
 
# Data transformation for BareNuclei(which was showing character,nw changed as numeric)

cancer_data$BareNuclei=as.numeric(cancer_data$BareNuclei)
str(cancer_data)

#list rows data that have missing values , is.na
# create new data set without missing data, mydata [complete.cases(maydata),]
#omit missing data na.omit(mydata)


is.na(cancer_data$clumpT)
is.na(cancer_data$Cellsize)
is.na(cancer_data$cellshape)
is.na(cancer_data$M_A)
is.na(cancer_data$EpithelialCellSize)

cancer_data = cancer_data[complete.cases(cancer_data),]
str(cancer_data)
# assign 

# Training & Testing
# split data into 70 : 30 ratio

traing_cancer = cancer_data[1:477,1:9]
test_cancer = cancer_data[478:682,1:9]

traing_cancer_outcome = cancer_data[1:477,10]
test_cancer_outcome = cancer_data[478:682,10]

# Applying Knn
# revoke package

library(class)

prediction_cancer = knn(train = traing_cancer,test = test_cancer,cl=traing_cancer_outcome,k=21)
prediction_cancer
table(test_cancer_outcome,prediction_cancer)
