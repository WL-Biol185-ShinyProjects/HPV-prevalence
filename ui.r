write.csv(HPV_Prevalence)
write.csv(HPV_cancers)
write.csv(HPV_cervicalcancers)

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
               tabName = "Related_cancers"),
      menuItem("HPV Cervical Cancer",
               icon    = icon("angle-right"),
               tabName = "Cervical_cancer")
    )
  ),
  dashboardBody(
     tabItems(
      tabItem(tabname = "HPV_types",
              sidebarLayout(
                sidebarPanel(
                  selectInput(
                    inputId  = "Prevalence_group_by",
                    label    = "Input",
                    choices  = list(Country = "Country",
                                    Type    = "HPV_Type"),
                    selected = "Country"
                  ),
                  
                  selectInput(
                    inputId  = "X_axis",
                    label    = "Input",
                    choices  = list(Country = "Country",
                                    Type    = "Type"),
                    selected = "Country"
                  ),
                  
                  selectizeInput(
                    inputId  = "Prevalence_include_countries",
                    label    = "Include Countries",
                    choices  = unique(HPV_Prevalence$Country),
                    multiple = FALSE,
                    selected = unique(HPV_Prevalence$Country)
                  )
                ),
                  
                  mainPanel(
                    plotOutput("Country_bar")
                  )
              )
            ), 
      
      tabItem(tabName = "Related_cancers", 
              sidebarLayout(
                sidebarPanel(
                  selectInput(
                    inputId  = "country_choice",
                    label    = "Country",
                    choices  = unique(HPV_cancers$country),
                    multiple = TRUE,
                    selected = unique(HPV_cancers$country)             
                  ),
                  
                  selectizeInput(
                    inputId  = "cancers",
                    label    = "Cancer",
                    choices  = unique(HPV_cancers$cancer_type),
                    multiple = FALSE,
                    selected = "Cervical"
                    
                  ),
                  
                  selectizeInput(
                    inputId  = "cancer_type",
                    label    = "Cancer",
                    choices  = unique(HPV_cancers$cancer_type),
                    inputId  = "ages",
                    label    = "Age Range",
                    choices  = unique(HPV_cancers$age_range),
                    multiple = TRUE,
                    selected = unique(HPV_cancers$age_range)
                    
                  )
                ),
                
                mainPanel(
                  plotOutput("Cancer_bar")
                )
               ),
          
            ),
      
      tabItem(tabName = "Cervical_cancer",
              sidebarLayout(
                sidebarPanel(
                  selectInput(
                    inputId  = "country_choice",
                    label    = "Country",
                    choices  = unique(HPV_cervicalcancers$country),
                    multiple = TRUE,
                    selected = unique(HPV_cervicalcancers$country)             
                  ),
                )
              )
            )
          )
        )
      )
                  
                  selectizeInput(
                    inputId  = "ages",
                    label    = "Age Range",
                    choices  = unique(HPV_cervicalcancers$age_range),
                    multiple = TRUE,
                    selected = unique(HPV_cervicalcancers$age_range)
                    
                  )
                ),
                
                mainPanel(
                  plotOutput("Cervical_cancer_bar")
                )
              )
      )
      
     
    )
  )
)