library(mice)
library(dplyr)
md.pattern(portfolio_raw_data) %>% View()

portfolio_raw_data %>% 
  select(-strategic_address) -> portfolio_data

portfolio_data %>% 
  mice(m = 1, method = "rf") -> portfolio_data_imputed

densityplot(portfolio_data_imputed, ~LGD)

complete(portfolio_data_imputed) -> portfolio_data_complete

md.pattern(portfolio_data_complete)

portfolio_data_complete %>% filter(PD < 0 | PD > 1) %>% View()

portfolio_data_complete %>% 
  mutate(test_exposure = (exposure_defaulted + 
                            exposure_non_defaulted) == total_exposure) -> data_quality_check


boxplot(portfolio_data_complete$LGD)

boxplot(portfolio_data_complete$defaulted_obligors)

boxplot.stats(portfolio_data_complete$defaulted_obligors) -> stats
str(stats)

stats$stats[1] -> lower
stats$stats[5] -> upper

portfolio_data_complete %>% 
  mutate(defaulted_obligors_cens = case_when(defaulted_obligors < lower  ~ lower,
                                             defaulted_obligors > upper ~ upper,
                                             TRUE ~ defaulted_obligors)) -> portfolio_data_comple_cens

boxplot(portfolio_data_comple_cens$defaulted_obligors_cens)

portfolio_data_comple_cens$defaulted_obligors_cens %>% max()

save(portfolio_data_comple_cens,file = "output/portfolio_data_clean.RData")
