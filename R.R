library(dplyr)
df<-read.csv("C:/Users/dell/OneDrive/Desktop/HR_Attrition_dataset.csv")
head(df)
colnames(df)
df<- df%>%
  select("Age", "Department", "Salary", "Attrition", "Gender", "Overtime")
df
high_salary <- df %>%
  arrange(desc(Salary))
head(high_salary)

df %>%
  filter(Attrition == "Yes") %>%
  group_by(Department) %>%
  summarise(Total_Left = n())

head(df)
dept_count <- df %>%
  group_by(Department) %>%
  summarise(Total_Employees = n())
head(dept_count)

avg_salary <- df %>%
  group_by(Department) %>%
  summarise(Average_Salary = mean(Salary, na.rm = TRUE))
head(avg_salary)

attrition_dept <- df %>%
  group_by(Department, Attrition) %>%
  summarise(Count = n())
attrition_dept

