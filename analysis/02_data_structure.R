
library(dplyr)
class(portfolio_raw_data)
dim(portfolio_raw_data)
names(portfolio_raw_data)

str(portfolio_raw_data)
glimpse(portfolio_raw_data)


head(portfolio_raw_data)
tail(portfolio_raw_data)
head(portfolio_raw_data) %>% View()

portfolio_raw_data %>% 
  group_by(macro_portfolio) %>% 
  top_n(n=5,wt=PD) %>% 
  View()
