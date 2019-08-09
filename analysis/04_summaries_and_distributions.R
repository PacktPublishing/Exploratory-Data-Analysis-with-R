library(ggplot2)
quantile(portfolio_data_comple_cens$LGD)
median(portfolio_data_comple_cens$LGD)
table(portfolio_data_comple_cens$LGD)
portfolio_data_comple_cens %>% 
  group_by(LGD) %>% 
  count() %>% 
  View()

portfolio_data_comple_cens %>% 
  ggplot(aes(x = macro_portfolio)) +
  geom_histogram(stat = "count")

portfolio_data_comple_cens %>% 
  group_by(Portfolio) %>% 
  summarise(mean_LGD = mean(LGD), mean_PD = mean(PD)) 

portfolio_data_comple_cens$non_defaulted_obligors %>% 
  mean()

portfolio_data_comple_cens$non_defaulted_obligors %>% 
  var()

portfolio_data_comple_cens$non_defaulted_obligors %>% 
  sd()

portfolio_data_comple_cens$non_defaulted_obligors %>% boxplot(horizontal = T)

portfolio_data_comple_cens %>% 
  ggplot(aes(x = non_defaulted_obligors))+
  geom_density()

portfolio_data_comple_cens$non_defaulted_obligors %>% median()
