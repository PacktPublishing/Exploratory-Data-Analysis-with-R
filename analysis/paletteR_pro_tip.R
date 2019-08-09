library(paletter)
library(ggplot2)


























ggplot(data = mtcars_filter, aes(x = rownames(mtcars_filter),y = hp,color = rownames(mtcars_filter),
                          fill = rownames(mtcars_filter))) +
  geom_bar(stat = 'identity') +
  scale_color_manual(values = colours_vector) +
  scale_fill_manual(values=colours_vector)+
  theme_minimal() +
  guides(size = FALSE) +
  theme(legend.position = "bottom") +
  labs(title = "disp vs hp")+
  coord_flip()
