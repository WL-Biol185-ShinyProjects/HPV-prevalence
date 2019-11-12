View(HPV_Prevalence)

library(shiny)
library(ggplot2)

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
    ),
    
    mainPanel(
      plotOutput("country.density")
    )
  )
)