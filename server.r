library(shiny)
library(ggplot2)
library(tidyverse)

function(input, output) {
  
  output$country.density <- renderPlot({
    HPV_Prevalence %>%
      filter(Country %in% input$prevalence.include.countries) %>%
      ggplot(aes_string("HPV_Prevalence", fill = input$prevalence.group.by)) +
      geom_density(alpha = 0.2)
  })
}

function(input, output){

  output$HPV_relcancers_prevalencebyage <- renderPlot({
    
    HPV_cancers %>%
      ggplot(aes_string("country", "age_range", fill = "age range")) + 
      geom_col(alpha = 0.2)
  })
  
}