library(rio)

portfolio_raw_data <- import("analysis/portfolio_data.xlsx")

save(portfolio_raw_data, file = "output/portfolio_raw_data.RData")
