#sourcing files
setwd("~/Documents/Biometry/Lemurs")
Data<-read.csv("e.rubriventer_frugivory_data_2018_DRYAD.csv")
summary(Data)

# Assuming your dataset is named 'Data' and has columns 'time' and 'end_event'
# Convert 'time' and 'end_event' columns to POSIXlt objects
Data$start_time <- strptime(Data$time, format = "%H:%M")
Data$end_time <- strptime(Data$end_event, format = "%H:%M")

# Calculate the time difference for each row (in minutes)
Data$time_difference <- difftime(Data$end_time, Data$start_time, units = "mins")

# View the updated dataset with time differences
print(Data)

# Assuming 'Data' is your dataset and 'focal' column defines the gender

# Split the data into males and females based on the 'focal' column
males_data <- Data[Data$focal %in% c("AM", "SAM", "Ronono", "Akondro"), ]
females_data <- Data[Data$focal %in% c("AF", "SAF", "JUVF"), ]

# Summarize the time_difference for males
summary_males <- summary(males_data$time_difference)
mean_males <- mean(males_data$time_difference, na.rm = TRUE)
median_males <- median(males_data$time_difference, na.rm = TRUE)
sd_males <- sd(males_data$time_difference, na.rm = TRUE)

# Summarize the time_difference for females
summary_females <- summary(females_data$time_difference)
mean_females <- mean(females_data$time_difference, na.rm = TRUE)
median_females <- median(females_data$time_difference, na.rm = TRUE)
sd_females <- sd(females_data$time_difference, na.rm = TRUE)

# Print the summary stats for males and females
#male
cat("Males - Summary of time differences:\n")
print(summary_males)
cat("\nMean:", mean_males, "\n")
cat("Median:", median_males, "\n")
cat("Standard Deviation:", sd_males, "\n\n")
#female
cat("Females - Summary of time differences:\n")
print(summary_females)
cat("\nMean:", mean_females, "\n")
cat("Median:", median_females, "\n")
cat("Standard Deviation:", sd_females, "\n")

#boxplot male
boxplot(males_data$time_difference,
        col = "lightblue")
#boxplot female
boxplot(females_data$time_difference,
        col = "pink")

#t-test
t_test_result <- t.test(males_data$time_difference, females_data$time_difference)
# Print the t-test result
print(t_test_result)



