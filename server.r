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