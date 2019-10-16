# ui.R for ShinyBMI

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Calculate your Body Mass Index"),
  
  # Instructions
  helpText("If you are interested in your health, you might be interested in knowing if
           your weight healthy."),
  
  helpText(HTML("Of course your \"ideal\" weight depends on your height.<br>One generally accepted measure
           of your weight, considering height, is Body Mass Index, often just referred to as <b>BMI</b>.")),
  
  helpText(HTML("Use the sliders below to enter your weight.<br>
                Your BMI and classification will be calculated and displayed on the right.<br>&nbsp;")),
  
  
  # Input sliders
  sidebarLayout(
    sidebarPanel(
      sliderInput("weight",
                  "Your weight in kilograms:",
                  min = 1,
                  max = 250,
                  value = 87),
      sliderInput("height",
                  "Your height in centimeters:",
                  min = 50,
                  max = 240,
                  value = 184)
    ),
    
    # Show result
    mainPanel(
      h3("Your BMI:"),
      textOutput("BMI"),
      h3("Your body is:"),
      textOutput("status")
    )
  )
))
