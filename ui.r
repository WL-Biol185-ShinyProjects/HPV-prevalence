View(HPV_Prevalence)

library(shiny)
library(ggplot2)
library(tidyverse)

fluidPage(
  
  title = "HPV Interactive",
  titlePanel("Prevalence of HPV Types"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId  = "prevalence.group.by",
        label    = "Input",
        choices  = list(Country = "Country", 
                        Type    = "HPV_Type"),
        selected = "Country"
      
      ), 
      selectizeInput(
        inputId  = "prevalence.include.countries",
        label    = "Include Countries",
        choices  = unique(HPV_Prevalence$Country), 
        multiple = FALSE,
        selected = unique(HPV_Prevalence$Country)
      )
    )
  ),
  
  mainPanel(
    plotOutput("country.density")
  )
)

fluidPage(
  
  title = "HPV Related Cancers and Prevalence in Different Countries",
  titlePanel("HPV Realted Cancers"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "country",
        label = "Country",
        choices = list(unique(HPV_cancers$country),
                       
        ),
        multiple = TRUE,
        selected = unique(HPV_cancers$country)
      ),
      selectizeInput(
        
        
        inputId = "age_range",
        label = "Age Range",
        choices = unique(HPV_cancers$age_range),
        multiple = TRUE,
        selected = unique(HPV_cancers$age_range)
      )
    )
  ),
    
    mainPanel(
      plotOutput("HPV_relcancers_prevalencebyage")
    )
)
