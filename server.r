#load(file = ".RData")

library(shiny)
library(ggplot2)
library(tidyverse)

function(input, output) {
  
  output$Country_bar <- renderPlot({
    if (input$X_axis     == "Type"){
      HPV_Prevalence %>%
        filter(Country   == input$chosen_country) %>%
        filter(Histology == "Any Histology")      %>%
        ggplot(aes_string("Type", "Prevalence"))          +
        geom_bar(stat     = 'identity', fill = "#F8AE9E") +
        theme(axis.text.x = element_text(size = 9, angle = 90, hjust = 1))
    } else{
      HPV_Prevalence %>%
        filter(Type      == input$chosen_type)    %>%
        filter(Histology == "Any Histology")      %>%
        ggplot(aes_string("Country", "Prevalence"))       +
        geom_bar(stat     = 'identity', fill  = "#F8AE9E")+
        theme(axis.text.x = element_text(size = 9, angle = 90, hjust = 1))
    }
   })
  
   output$Choice <- renderUI({
    if (input$X_axis     == "Type"){
      selectInput('chosen_country', "Choose Country", choices = unique(HPV_Prevalence$Country))
    } else {
      selectInput('chosen_type', "Choose Type", choices = unique(HPV_Prevalence$Type))
    }
   })

  output$Cancer_bar <- renderPlot({
    HPV_cancers                                 %>%
      filter(country %in% input$country_choice) %>%
      filter(cancer_type %in% input$cancers)    %>%
      filter(age_range %in% input$ages)         %>%
      ggplot(aes_string("country", "number_of_cases", fill = "age_range")) +
      geom_col(alpha = 0.8)+
      theme(axis.text.x = element_text(size = 9, angle = 60, hjust = 1)) + 
      labs(y = "Number of Cases", x = "Country",      fill = "Age Range")
      
  })
  
  output$Cervical_cancer_bar <- renderPlot({

    HPV_cervicalcancers                             %>%
      filter(country %in% input$country_choice_cer) %>%
      filter(age_range %in% input$ages_cer)         %>%
      ggplot(aes_string("country", "number_of_cases", fill = "age_range")) +
      geom_col(alpha    = 0.8)+
      theme(axis.text.x = element_text(size = 9, angle = 60, hjust = 1)) +
      labs(y = "Number of Cases", x = "Country",      fill = "Age Range")

  })
  
  output$Age_bar <- renderPlot({
    
    HPV_cancers                                      %>%
      filter(country %in% input$country_choice_coun) %>%
      filter(age_range %in% input$ages_coun)         %>%
      filter(cancer_type %in% input$cancers_coun)         %>%
      ggplot(aes_string("age_range", "number_of_cases", fill = "cancer_type")) +
      geom_col(alpha    = 0.8)+
      theme(axis.text.x = element_text(size = 9, angle = 60, hjust = 1)) +
      labs(y = "Number of Cases", x = "Age Range",      fill = "Cancer Type")
    
  })
  
  
}