write.csv(HPV_Prevalence)
write.csv(HPV_cancers)
write.csv(HPV_cervicalcancers)

library(shiny)
library(shinydashboard)
library(ggplot2)
library(tidyverse)

dashboardPage(
  skin = "black",
  dashboardHeader(title = "HPV and Related Cancers", 
                  titleWidth = 300),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", 
               icon    = icon("dashboard"),
               tabName = "dashboard" 
               ), 
      menuItem("About HPV", 
               icon    = icon("angle-right"), 
               tabName = "information"
               ),
      menuItem("HPV Types", 
               icon    = icon("angle-right"), 
               tabName = "HPV_types"), 
      menuItem("Related Cancers", 
               icon    = icon("angle-right"), 
               tabName = "Related_cancers"),
      menuItem("HPV Cervical Cancer",
               icon    = icon("angle-right"),
               tabName = "Cervical_cancer"),
      menuItem("Resources",
               icon    = icon("angle-right"),
               tabName = "resources"
               )
    )
  ),
  dashboardBody(
     tabItems(
      tabItem(tabName = "dashboard",
              fluidRow(
                box(
                  title      = "HPV and Related Cancers",
                  width      = 15,
                  background = "teal", 
                  "Whitley Drinkard and Mikki Whittington"
                )
              )
            ), 
      
      tabItem(tabName = "information", 
              fluidRow(
                box(
                  title      = "Box Title",
                  width      = 10, 
                  background = "teal", 
                  "A box with a teal background"
                ),
                valueBox(
                 14, 
                 "million new cases of HPV every year in the US", 
                 icon = icon("diagnoses")
                ), 
                valueBox(
                  630, 
                  "million people worldwide are infected with HPV", 
                  icon = icon("users")
                ), 
                valueBox(
                  4250,
                  "deaths from cervical cancer this year",
                  icon = icon("ambulance")
                )
              )
      ),
      
      tabItem(tabname = "HPV_types",
              sidebarLayout(
                sidebarPanel(
                  selectInput(
                    inputId  = "Prevalence_group_by",
                    label    = "Output",
                    choices  = "Prevalence",
                    selected = "Prevalence"
                  ),
                  
                  selectInput(
                    inputId  = "X_axis",
                    label    = "Input",
                    choices  = list(Country = "Country",
                                    Type    = "Type"),
                    selected = "Type"
                  ),
                  
                  uiOutput("Choice")
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
               )

            ),

      tabItem(tabName = "Cervical_cancer",
              sidebarLayout(
                sidebarPanel(
                  selectInput(
                    inputId  = "country_choice_cer",
                    label    = "Country",
                    choices  = unique(HPV_cervicalcancers$country),
                    multiple = TRUE,
                    selected = unique(HPV_cervicalcancers$country)
                  ),

                  selectizeInput(
                    inputId  = "ages_cer",
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
          ), 
      tabItem(tabName = "resources", 
              fluidRow(
                box(
                  title = "Resources",
                  width = 15, 
                  background = "teal", 
                  p("American Sexual Health Association"), 
                  p("Cancer.Net"),
                  p("HPV Information Centre")
                )
              )
            )
          )
        )
      )
