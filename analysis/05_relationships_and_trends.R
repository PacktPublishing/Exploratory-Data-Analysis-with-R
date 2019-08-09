portfolio_data_comple_cens %>% 
  select(non_defaulted_obligors,
         defaulted_obligors,
         exposure_defaulted,
         exposure_non_defaulted,
         PD,
         LGD) -> numeric_portfolio
cor(numeric_portfolio,method ="pearson") %>% View()

library(energy)
dcor(portfolio_data_comple_cens$non_defaulted_obligors,
     portfolio_data_comple_cens$exposure_non_defaulted)

pairs(numeric_portfolio)

portfolio_data_comple_cens %>% 
  filter(PD <=1) %>% 
  ggplot(aes(x = Portfolio,y = PD))+
  geom_boxplot()+
  coord_flip()


sunspot <- data.frame(year = seq(from=1700,to =1988),
                      sunspot = sunspot.year)
sunspot %>% 
  ggplot(aes(x = year,y=sunspot))+
  geom_line()

sunspot %>% 
  select(sunspot) %>% 
  pull() %>% 
  sd()

sunspot %>% 
  ggplot(aes(x = year,y = sunspot))+
  geom_line()+
  geom_smooth()








