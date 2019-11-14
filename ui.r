View(HPV_Prevalence)
View(HPV_cancers)

library(shiny)
library(shinydashboard)
library(ggplot2)
library(tidyverse)

dashboardPage(
  dashboardHeader(title = "HPV and Related Cancers"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", 
               tabName = "dashboard", 
               icon    = icon("dashboard")), 
      menuItem("HPV Types", 
               icon    = icon("angle-right"), 
               tabName = "HPV_types"), 
      menuItem("Related Cancers", 
               icon    = icon("angle-right"), 
               tabName = "Related_cancers")
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabname = "HPV_types", 
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
                plotOutput("Country_density")
              )
            ), 
      
      tabItem(tabName = "Related_cancers", 
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
                ), 
                
                mainPanel(
                  plotOutput("HPV_relcancers_prevalencebyage")
                )
              )
            )
          )
        )
      )
