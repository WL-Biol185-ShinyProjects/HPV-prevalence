library(shiny)
library(ggplot2)
library(tidyverse)



function(input, output){
  
  output$HPV_relcancers_prevalencebyage <- renderPlot({
    
    HPV_cancers %>%
      ggplot(aes_string("country", "age_range", fill = "age range")) + geom_col(alpha = 0.2)
  })
  
}