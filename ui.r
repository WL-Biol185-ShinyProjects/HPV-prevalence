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
                  title      = h3("HPV and Related Cancers"),
                  width      = 15,
                  background = "teal", 
                  h4("Whitley Drinkard and Mikki Whittington"),
                  p("BIOL185 Winter 2019 Final Project")
                )
              )
            ), 
      
      tabItem(tabName = "information", 
              fluidRow(
                box(
                  title      = "What is HPV?",
                  width      = 12, 
                  background = "teal", 
                  p("HPV stands for human papilloma virus and refers to 
                    a group of viruses that affect the skin. HPV is the 
                    most common STI in the world. While it usually disappears
                    on its own, HPV can cause genital warts and may lead to 
                    cancer.")
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
                ),
                box(
                  title = "Different Types of HPV", 
                  width = 12, 
                  background = "teal", 
                  p("There are more than 200 different types of HPV. About 40
                    different types can cause genital warts, and the others can 
                    cause warts such as those that you may get on your hands or 
                    feet. HPV types 6 and 11 cause most of the cases of genital 
                    warts, while HPV types 16 and 18 cause a significant number 
                    of the cases of HPV-related cancers.")
                ), 
                tabBox(
                  title  = "HPV-Related Cancers", 
                  height = 250, 
                  width  = 12, 
                  tabPanel(
                    "Cervical Cancer", 
                    p("Essentially all cases of cervical cancer are due to HPV 
                      infection. Fortunately cervical cancer can be caught early
                      and even prevented with routine screenings. Women should 
                      begin having papsmears at the age of 21. If the papsmear 
                      is normal, it only needs to be repeated every three years.
                      More than half of the women in the United States who have 
                      cervical cancer have never had a papsmear."), 
                    br(), 
                    p("Symptoms of cervical cancer include: vaginal bleeding after
                      intercourse, between periods, or after menopause, watery,
                      bloody vaginal discharge that may be heavy and have a foul 
                      odor, and pelvic pain or pain during intercourse.")
                  ), 
                  tabPanel(
                    "Vulvar Cancer", 
                    p("HPV can also cause cancer of the vulva which is the external
                      components of the female genitalia. Vulvar cancer is most 
                      commonly diagnosed in older women. Exposure to HPV and smoking
                      increase the risk of developing vulvar cancer. It usually 
                      presents as a sore or lump, and can usually be removed 
                      surgically."), 
                    br(), 
                    p("Symptoms of vulvar canccer include: itching that doesn't 
                      go away, pain and tenderness, bleeding that isn't from 
                      menstruation, skin changes (such as color changes or 
                      thickening), and a lump, wart-like bumps or an open sore.")
                  ), 
                  tabPanel(
                    "Vaginal Cancer", 
                    p("Most vaginal cancers are related to HPV, and vaginal pre-
                      cancers can sometimes be found with a papsmear. If vaginal 
                      pre-cancer is found, it can usually be removed before it 
                      develops into cancer. Vaginal cancer is rare, but if it is
                      allowed to spread beyond the vagina, it becomes difficult 
                      to treat."), 
                    br(), 
                    p("Symptoms of vaginal cancer include: unusual vaginal bleeding, 
                      watery vaginal discharge, a lump or mass in the vagina, painful
                      urination, frequent urination, constipation, and pelvic pain.")
                  )
                )
              )
      ),
      
      tabItem(tabname = "HPV_types",
              sidebarLayout(
                sidebarPanel(
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
                  title = strong("Resources"),
                  width = 15, 
                  background = "teal", 
                  p("American Sexual Health Association"), 
                  p("Cancer.Net"),
                  p("HPV Information Centre"), 
                  p("Mayo Clinic"),
                  p("Planned Parenthood")
                )
              )
            )
          )
        )
      )
