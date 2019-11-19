library(shiny)
library(ggplot2)
library(tidyverse)

function(input, output) {
  
  output$Country_bar <- renderPlot({
    HPV_Prevalence      %>%
      filter(Country    %in% input$Prevalence_include_countries)    %>%
      ggplot(aes_string(Country, Prevalence)) +
      geom_bar(stat = 'identity')
  })

  output$Cancer_bar <- renderPlot({
    
    HPV_cancers %>%
      ggplot(aes_string("country", "age_range", fill = "age range")) + 
      geom_col(alpha = 0.2)
  })
  
}