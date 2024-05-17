

data_LM1_pricei <- read.csv("~/Documents/shape/data/matlab/data_LM1_pricei.csv")

# Calculate the number of files to be created based on rows
num_files <- nrow(data_LM1_pricei) %/% 2

# Loop through each pair of rows and write to a separate CSV file
for (i in 1:num_files) {
  start_row <- (i - 1) * 2 + 1
  end_row <- start_row + 1
  
  # Subset the two rows
  data_subset <- data_LM1_pricei[start_row:end_row, ]
  
  # Define the file path
  file_name <- paste0("~/Documents/shape/data/individuals/LM1_pricei/data_LM1_pricei_", i, ".csv")
  
  # Write to CSV
  write.csv(data_subset, file = file_name, row.names = FALSE)
}
