library(rio)
HPV_Prevalence      <- import("HPV_Prevalence.txt")
HPV_cervicalcancers <- import("HPV_cervicalcancers.csv")
HPV_cancers         <- import("HPV_cancers.csv")

View(HPV_cancers)
View(HPV_cervicalcancers)
View(HPV_Prevalence)