load(file = ".RData")

library(shiny)
library(shinydashboard)
library(ggplot2)
library(tidyverse)

dashboardPage(
  skin = "black",
  dashboardHeader(title = "HPV and Related Cancers", 
                  titleWidth = 275),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", 
               icon    = icon("dashboard"),
               tabName = "Dashboard" 
               ), 
      menuItem("About HPV", 
               icon    = icon("angle-right"), 
               tabName = "Information"
               ),
      menuItem("HPV Types", 
               icon    = icon("chart-bar"), 
               tabName = "HPV_types"), 
      menuItem("Related Cancers", 
               icon    = icon("chart-bar"), 
               tabName = "Related_cancers"),
      menuItem("HPV Cervical Cancer",
               icon    = icon("chart-bar"),
               tabName = "Cervical_cancer"),
      menuItem("HPV Age Distribution",
               icon    = icon("chart-bar"),
               tabName = "Age_country"),
      menuItem("Resources",
               icon    = icon("list"),
               tabName = "Resources"
               )
    )
  ),
  dashboardBody(
     tabItems(
      tabItem(tabName = "Dashboard",
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
      
      tabItem(tabName = "Information", 
              fluidRow(
                box(
                  title      = "What is HPV?",
                  width      = 12, 
                  background = "teal", 
                  p("HPV stands for human papilloma virus and refers to 
                    a group of viruses that affect the skin. HPV is the 
                    most common STI in the world. While it usually disappears
                    on its own, HPV can cause genital warts and may lead to 
                    cancer. Without treatment it is likely that the body's
                    immune system will eliminate the virus within about two years.
                    However, you can be reinfected with HPV, and as long as the 
                    virus is still present in your body, you can transmit HPV
                    to your sexual partners.")
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
                  p("There are more than 200 different types of HPV. HPV is often
                    asymptomatic in either sex. However, about 40 different types 
                    can cause genital warts, and the others can cause warts such 
                    as those that you may get on your hands or feet. HPV types 6 
                    and 11 cause most of the cases of genital warts, while HPV 
                    types 16 and 18 cause a significant number of the cases of HPV-
                    related cancers.")
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
                    p("Most vaginal cancers are related to HPV, and vaginal 
                      pre-cancers can sometimes be found with a papsmear. If vaginal 
                      pre-cancer is found, it can usually be removed before it 
                      develops into cancer. Vaginal cancer is rare, but if it is
                      allowed to spread beyond the vagina, it becomes difficult 
                      to treat."), 
                    br(), 
                    p("Symptoms of vaginal cancer include: unusual vaginal bleeding, 
                      watery vaginal discharge, a lump or mass in the vagina, painful
                      urination, frequent urination, constipation, and pelvic pain.")
                  ), 
                  tabPanel(
                    "Penile Cancer", 
                    p("HPV can cause penile cancer in men, and HPV type 16 antibodies
                      have been found in many patients with penile cancer; however 
                      penile cancer is more likely to result from HIV than from HPV. 
                      Almost all penile cancers start underneath the foreskin and are 
                      likely to be noticed early in the disease. Men who are not 
                      circumcised or are smokers are at a greater risk for penile 
                      cancer."),
                    br(), 
                    p("Symptoms of penile cnacer include: skin changes, swelling at
                      the end of the penis, and lumps under the skin in the groin area.")
                  ), 
                  tabPanel(
                    "Anal Cancer", 
                    p("HPV can also cause cancer of the anal canal in both men and women,
                      but similarly to penile cancer, it is more commonly associated
                      with HIV infection. However, anal cancer is still relatively 
                      uncommon. For those deemed to be at high risk of developing 
                      anal cancer, anal pap tests can be performed. However, this is 
                      not routinely recommended for most people."),
                    br(), 
                    p("Symptoms of anal cancer include: bleeding from the anus or
                      rectum, pain in the area of the anus, a mass or growth in the 
                      anal canal, and anal itching.")
                  )
                )
              )
            ),
      
      tabItem(tabname = "HPV_Types",
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
      
      tabItem(tabName = "Age_country",
              sidebarLayout(
                sidebarPanel(
                  selectInput(
                    inputId  = "country_choice_coun",
                    label    = "Country",
                    choices  = unique(HPV_cancers$country),
                    multiple = FALSE,
                    selected = "United States of America"
                  ),
                  
                  selectizeInput(
                    inputId  = "cancers",
                    label    = "Cancer",
                    choices  = unique(HPV_cancers$cancer_type),
                    multiple = TRUE,
                    selected = unique(HPV_cancers$cancer_type)
                    
                  ),
                  
                  selectizeInput(
                    inputId  = "ages_coun",
                    label    = "Age Range",
                    choices  = unique(HPV_cancers$age_range),
                    multiple = TRUE,
                    selected = unique(HPV_cancers$age_range)
                    
                  )
                ),
                
                mainPanel(
                  plotOutput("Age_bar")
                )
              )
            ),
      
      tabItem(tabName = "Resources", 
              fluidRow(
                box(
                  title = strong("Resources"),
                  width = 15, 
                  background = "teal", 
                  p("American Cancer Society"),
                  p("American Sexual Health Association"), 
                  p("Cancer.Net"),
                  p("HPV Information Centre"), 
                  p("Mayo Clinic"),
                  p("Planned Parenthood"), 
                  p("Urology Care Foundation")
                )
              )
            )
          )
        )
      )