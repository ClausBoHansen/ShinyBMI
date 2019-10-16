# server.R for ShinyBMI

library(shiny)
library(dplyr)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

   BMI <- reactive({
     round(input$weight / ((input$height/100)^2),1)
     })
   
   output$BMI <- renderText(BMI())
   
   output$status <- reactive({
     case_when(BMI() < 15 ~ "Very severely underweight",
               BMI() < 16 ~ "Severely underweight ",
               BMI() < 18.5 ~ "Underweight",
               BMI() < 25 ~ "Normal (healthy weight)",
               BMI() < 30 ~ "Overweight",
               BMI() < 35 ~ "Obese Class I (Moderately obese)",
               BMI() < 40 ~ "Obese Class II (Severely obese)",
               BMI() < 45 ~ "Obese Class III (Very severely obese)",
               BMI() < 50 ~ "Obese Class IV (Morbidly Obese)",
               BMI() < 60 ~ "Obese Class V (Super Obese)",
               TRUE ~ "Obese Class VI (Hyper Obese)")
    })
  
})
