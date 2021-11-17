library(dplyr)

#read_csv("5000 Records.csv")

raw_data <- readr::read_csv(file = "5000 Records.csv", name_repair = janitor::make_clean_names)

male_employees <- filter(raw_data, gender == "M")

female_employees <- filter(raw_data, gender == "F")

# joined prior to 2010, not male, middle initial is not either A, B, C, or D.
# Sort by middle initial (ascending order) and last name (descending order)

filtered_and_arranged <- filter(raw_data, year_of_joining < 2010 & gender != "M" & !middle_initial %in% c("A", "B", "C", "D")) %>%
  arrange(middle_initial, desc(last_name))

#select call out all the columns
filtered_and_arranged %>%
    select(emp_id, first_name, middle_initial, last_name)

#select from to
filtered_and_arranged %>%
  select(emp_id:last_name)

#select by column number
filtered_and_arranged %>%
  select(1:5)

filtered_and_arranged %>%
  select(emp_id, first_name, middle_initial, last_name, title = name_prefix)

filtered_and_arranged %>%
  select(emp_id, first_name, middle_initial, last_name, title = name_prefix, everything())


filtered_and_arranged %>%
  select(emp_id, ends_with("name"))
         
filtered_and_arranged %>%
  select(emp_id, starts_with("name"))

filtered_and_arranged %>%
  select(emp_id, ends_with("name")) %>%
  mutate(full_name = paste("Lee", "Durbin")) #hard coding and by default adding spaces between columns


filtered_and_arranged %>%
  select(emp_id, ends_with("name")) %>%   
  mutate(full_name = paste0("Lee", "Durbin")) #hard coding and without a space (all one word)

filtered_and_arranged %>%
  select(emp_id, ends_with("name")) %>%   
  mutate(full_name = paste0(sep = " ", "Lee", "Durbin"))

filtered_and_arranged %>%
  select(emp_id, ends_with("name")) %>%   
  mutate(full_name = paste(first_name, last_name)) 

filtered_and_arranged %>%
  select(emp_id, ends_with("name")) %>% 
  mutate(full_name = paste0(first_name, " ", last_name, " (", emp_id, ")"), .keep = "unused")
