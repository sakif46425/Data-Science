
# Load necessary libraries

library(dplyr)


#  Read the CSV file

file_path <- "E:/Summer semester 24-25/01022 - INTRODUCTION TO DATA SCIENCE [B]/Mid-Report/IDS Sec-B Midterm Summer 24-25 Depression Student Dataset - modified.csv"
df <- read.csv(file_path, stringsAsFactors = FALSE)

cat("Dataset loaded successfully!\n")
cat("Number of rows:", nrow(df), "\n")
cat("Number of columns:", ncol(df), "\n\n")


#  Define numeric & categorical columns
numeric_cols <- sapply(df, is.numeric)
cat_cols <- !numeric_cols

cat(" Numeric columns:\n")
print(names(df)[numeric_cols])
cat("\n Categorical columns:\n")
print(names(df)[cat_cols])
cat("\n")

# Summary of numeric columns
cat(" Summary of numeric columns:\n")
print(summary(df[, numeric_cols]))

# Summary of categorical columns
cat("\n Summary of categorical columns:\n")
for (col in names(df)[cat_cols]) {
  cat("\n", col, ":\n")
  print(table(df[[col]], useNA = "ifany"))
}



# 3. Check for duplicates & remove

duplicate_count <- sum(duplicated(df))
cat(" Number of duplicate rows found:", duplicate_count, "\n")

if (duplicate_count > 0) {
  df <- df %>% distinct()
  cat("Duplicates removed. New row count:", nrow(df), "\n\n")
} else {
  cat(" No duplicates found.\n\n")
}


# 4. Convert missing values to NA

df[df == "" | df == " "] <- NA
cat(" Blank cells converted to NA (null values in R)\n\n")


# 5. Count NA values

cat(" NA values count in each column:\n")
print(colSums(is.na(df)))
cat("\n")


# 6. Handle missing values


# Helper function to find mode
get_mode <- function(v) {
  uniqv <- na.omit(unique(v))
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

# Fill categorical columns with mode
cat(" Filling missing values in categorical columns with MODE:\n")
cat_cols_names <- names(df)[cat_cols]

for (col in cat_cols_names) {
  mode_val <- get_mode(df[[col]])
  df[[col]][is.na(df[[col]])] <- mode_val
  cat(paste0(" ", col, " -> filled with mode: ", mode_val, "\n"))
}

cat("\n")

# Fill numeric columns
num_cols_names <- names(df)[numeric_cols]

cat(" Filling missing values in numeric columns:\n")
for (col in num_cols_names) {
  mean_val <- mean(df[[col]], na.rm = TRUE)
  median_val <- median(df[[col]], na.rm = TRUE)
  mode_val <- get_mode(df[[col]])
  
  # Choose method — here I use mean, but you can swap with median/mode
  df[[col]][is.na(df[[col]])] <- mean_val
  cat(paste0(" ", col, " -> filled with mean: ", round(mean_val, 2), 
             " | median: ", median_val, 
             " | mode: ", mode_val, "\n"))
}


# 7. Final NA check

cat("\n NA values after filling:\n")
print(colSums(is.na(df)))
cat("\n Missing values handled successfully!\n")


