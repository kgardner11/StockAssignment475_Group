library(shiny)
library(shinyWidgets)
library(quantmod)


shinyUI(fluidPage(
  titlePanel("Exploring Stocks of Top Fortune 500 Companies"),
  img(src = "logo.png", height = 100, width = 300),
  pickerInput(
    inputId = "ticker",
    label = "Choose Stock Symbol(s)", 
    choices = c("WMT", "AMZN", "AAPL", "CVS","UNH","MCK","ABC","GOOGL","XOM")
  ),
  htmlOutput("mySite"),
  verbatimTextOutput("stok"),
  verbatimTextOutput("position"),
  plotOutput("chart", click = "SD1"),
  radioButtons(
    "term",
    "Term",
    choices = c("Daily", "Weekly", "Monthly"),
  )
)
) 
