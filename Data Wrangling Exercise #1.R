
# Load dplyr and tidyr

library(dplyr)
library(tidyr)

# Import dataset

library(readr)
refine_original <- read_csv("~/School/Springboard/Exercises/Data Wrangling #1/refine_original.csv")
View(refine_original)

# Transform dataset into dataframe

refine_original_tbl <- tbl_df(refine_original)

refine_original_tbl


# Clean up dataset columns.

# Change all values in "company" variable to lowercase.


refine_original_tbl[1] <- mutate_each(refine_original_tbl[1], funs(tolower))

refine_original_tbl

# Correct spelling of all variables.

str(refine_original_tbl)
View(refine_original_tbl)

refine_original_tbl[1:6,1] <- "phillips"
refine_original_tbl[7:13,1] <- "akzo"
refine_original_tbl[14:16,1] <- "phillips"
refine_original_tbl[22:25,1] <- "unilever"

View(refine_original_tbl)

# Separate product code and product number into new columns, product_code and product_number, respectively.


out <- strsplit(as.character(refine_original_tbl[,2]),'-') 
do.call(rbind, out)
View(refine_original_tbl)
colnames(refine_original_tbl)[2] <- "superduper"
separate(data = refine_original_tbl, col = superduper, into = c("product_code", "product_number"), sep = "\\-")
refine_original_tbl <- separate(data = refine_original_tbl, col = superduper, into = c("product_code", "product_number"), sep = "\\-")
View(refine_original_tbl)


#Create new variable, product_categories

refine_original_tbl$product_categories <- c("Smartphone", "Smartphone", "Laptop", "Laptop", "Laptop", "Smartphone", "TV", "TV", "Laptop", "Smartphone", "Tablet", "Tablet", "Laptop", "Smartphone", "TV", "TV", "Laptop", "TV", "TV", "Laptop", "Smartphone", "Laptop", "Tablet", "Tablet", "Tablet")
View(refine_original_tbl)


#Concatenate address for geocoding

refine_original_tbl$full_address <- paste(refine_original_tbl$address, refine_original_tbl$city, refine_original_tbl$country, sep=",") 

View(refine_original_tbl)

# Create dummy variables for company and product category

# Company dummy variables
refine_original_tbl$company_phillips <- as.numeric(refine_original_tbl$company == "phillips")
View(refine_original_tbl)
refine_original_tbl$company_akzo <- as.numeric(refine_original_tbl$company == "akzo")
refine_original_tbl$company_van_houten <- as.numeric(refine_original_tbl$company == "van houten")
refine_original_tbl$company_unilever <- as.numeric(refine_original_tbl$company == "unilever")

# Product dummy variables

refine_original_tbl$product_smartphone <- as.numeric(refine_original_tbl$product_code == "p")
refine_original_tbl$product_tv <- as.numeric(refine_original_tbl$product_code == "v")
refine_original_tbl$product_laptop <- as.numeric(refine_original_tbl$product_code == "x")
refine_original_tbl$product_tablet <- as.numeric(refine_original_tbl$product_code == "q")

View(refine_original_tbl)



