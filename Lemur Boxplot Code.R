data<-read.csv("e.rubriventer_frugivory_data_2018_DRYAD.csv")
# Load necessary libraries
library(dplyr)
library(ggplot2)

data <- data %>%
  # Convert time columns to POSIXct date-time objects
  mutate(start_time = strptime(time, format = "%H:%M"),
         end_time = strptime(end_event, format = "%H:%M"),
         # Calculate duration in minutes
         duration = as.numeric(difftime(end_time, start_time, units = "mins")),
         # Group focal categories as Male or Female
         gender = ifelse(focal %in% c("AM", "SAM"), "Male", "Female"))

# Create box plot
ggplot(data, aes(x = gender, y = duration, fill = gender)) +
  geom_boxplot() +
  labs(title = "Time Spent on Activity by Gender",
       x = "Gender",
       y = "Duration (Minutes)") +
  theme_minimal()
