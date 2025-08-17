# Load necessary package
# install.packages("dplyr") # Uncomment this line if dplyr is not installed
library(dplyr)

# Define file path (use double backslashes or forward slashes)
file_path <- "E:/Summer semester 24-25/01022 - INTRODUCTION TO DATA SCIENCE [B]/Mid-Report/IDS Sec-B Midterm Summer 24-25 Depression Student Dataset - modified.csv"

# Read CSV file
data <- read.csv(file_path, stringsAsFactors = FALSE)

# View first few rows
head(data)

# Check the structure of the dataset
str(data)

# Identify numeric columns
numeric_cols <- names(data)[sapply(data, is.numeric)]
cat("Numeric Columns:\n")
print(numeric_cols)

# Identify categorical (character or factor) columns
categorical_cols <- names(data)[sapply(data, function(x) is.character(x) | is.factor(x))]
cat("Categorical Columns:\n")
print(categorical_cols)





# Check for duplicate rows
duplicate_rows <- duplicated(data)

# Number of duplicate rows
cat("Number of duplicate rows:\n")
print(sum(duplicate_rows))

# View the duplicate rows (if any)
cat("Duplicate rows:\n")
print(data[duplicate_rows, ])











# Check if there are any missing values (NA) in the dataset
cat("Any missing values in dataset?\n")
print(any(is.na(data)))

# Count total number of missing values in dataset
cat("Total missing values in dataset:\n")
print(sum(is.na(data)))

# Show number of missing values in each column
cat("Missing values per column:\n")
print(colSums(is.na(data)))








# Convert "?", "NULL", "N/A", or blank ("") values to NA
data[data == ""] <- NA
data[data == "?"] <- NA
data[data == "NULL"] <- NA
data[data == "N/A"] <- NA

# Confirm how many missing values are now in the dataset
cat("Total missing values after conversion:\n")
print(sum(is.na(data)))








# Check if any null (NA) values exist in the entire dataset
cat("Any null (NA) values in dataset?\n")
print(any(is.na(data)))

# Total number of null (NA) values
cat("Total number of null (NA) values:\n")
print(sum(is.na(data)))

# Number of null (NA) values per column
cat("Null (NA) values per column:\n")
print(colSums(is.na(data)))










# Function to calculate mode (most frequent value)
get_mode <- function(v) {
  uniqv <- unique(na.omit(v))
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

# Before filling missing values: Count missing in these columns
cat("Missing values before filling:\n")
cat("workex:", sum(is.na(data$workex)), "\n")
cat("degree_t:", sum(is.na(data$degree_t)), "\n")

# Fill missing values in categorical columns with mode
data$workex[is.na(data$workex)] <- get_mode(data$workex)
data$degree_t[is.na(data$degree_t)] <- get_mode(data$degree_t)

# For numeric columns, fill missing values with mean or median
# Let's use mean here (can switch to median if preferred)
for (col in numeric_cols) {
  if (sum(is.na(data[[col]])) > 0) {
    mean_value <- mean(data[[col]], na.rm = TRUE)
    data[[col]][is.na(data[[col]])] <- mean_value
    cat("Filled missing numeric values in", col, "with mean:", mean_value, "\n")
  }
}

# After filling missing values: confirm no missing in workex and degree_t
cat("\nMissing values after filling:\n")
cat("workex:", sum(is.na(data$workex)), "\n")
cat("degree_t:", sum(is.na(data$degree_t)), "\n")

# Confirm for numeric columns no missing remain
for (col in numeric_cols) {
  cat("Missing values in", col, ":", sum(is.na(data[[col]])), "\n")
}












