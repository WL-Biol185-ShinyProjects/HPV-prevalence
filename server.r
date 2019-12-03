library(shiny)
library(ggplot2)
library(tidyverse)

function(input, output) {
  
  output$Country_bar <- renderPlot({
    HPV_Prevalence      %>%
      filter(Country    %in% input$Prevalence_include_countries)    %>%
      ggplot(aes_string("HPV_Prevalence", fill = input$Prevalence_group_by)) +
      geom_density(alpha = 0.2)
  })

  output$Cancer_bar <- renderPlot({
    
    HPV_cancers                                 %>%
      filter(country %in% input$country_choice) %>%
      #should a have a filter for registry == National
      filter(cancer_type %in% input$cancers)    %>%
      filter(age_range %in% input$ages)         %>%
      ggplot(aes_string("country", "number_of_cases", fill = "age_range")) + 
      geom_col(alpha = 0.8)
    
  })
  
  output$Cervical_cancer_bar <- renderPlot({
    
    HPV_cervicalcancers                             %>%
      filter(country %in% input$country_choice_cer) %>%
      filter(age_range %in% input$ages_cer)         %>%
      ggplot(aes_string("country", "number_of_cases", fill = "age_range")) + 
      geom_col(alpha = 0.8)
    
  })
  
  
}