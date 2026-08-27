library(ggplot2)
ggplot(dept_count, aes(x = Department, y = Total_Employees)) +
  geom_bar(stat = "identity",fill="steelblue",color="black") +
  labs(title = "Employees by Department",
       x = "Department",
       y = "Count")
ggplot(attrition_dept, aes(x = Department, y = Count, fill = Attrition)) +
  geom_bar(stat = "identity",fill="steelblue",color="black") +
  labs(title = "Attrition by Department")
ggplot(df, aes(x = Age)) +
  geom_histogram(binwidth = 5,fill="red",color="black") +
  labs(title = "Age Distribution")
ggplot(df, aes(x = Attrition, y = Salary, fill = Attrition)) +
  geom_boxplot() +
  labs(title = "Salary vs Attrition")
gender_count <- df %>%
  group_by(Gender) %>%
  summarise(Count = n())

ggplot(gender_count, aes(x = "", y = Count, fill = Gender)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y")
