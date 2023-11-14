# jung mee park
# 2023-11-14

# whatfix regression analysis
#https://github.com/jmp243/studentworker-project.git

# load libraries
library(tidyverse)
# library(readxl)
library(openxlsx)

a <- loadWorkbook('combineddata.xlsx')
sheetNames <- sheets(a)
for(i in 1:length(sheetNames))
{
  assign(sheetNames[i],readWorkbook(a,sheet = i))
}

# remove index column in October1 file and Rename Email.x to Email
October1_users <- October1_users_dept_behavi %>% 
  select(-X1) %>% 
  rename(Email = Email.x)

# rename User.Name to email in Whatfix
Whatfix <- whatfix_University_Of_Arizona_u %>% 
  rename(Email = User.Name)

# combine columns
October1_whatfix <- October1_users %>% 
  left_join(Whatfix)
