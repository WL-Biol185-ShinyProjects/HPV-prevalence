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
                    inputId  = "Prevalence_group_by",
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
                  inputId  = "country",
                  label    = "Country",
                  choices  = unique(HPV_cancers$country),
                  multiple = TRUE,
                  selected = unique(HPV_cancers$country)
                ),

                selectizeInput(
                  inputId  = "age_range",
                  label    = "Age Range",
                  choices  = unique(HPV_cancers$age_range),
                  multiple = TRUE,
                  selected = unique(HPV_cancers$age_range)
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
                    plotOutput("Country_density")
                  )
                )
              )
            )
          )
        )
