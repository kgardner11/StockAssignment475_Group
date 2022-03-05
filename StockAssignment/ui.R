library(shiny)
library(shinyWidgets)
library(quantmod)


shinyUI(fluidPage(
  titlePanel("Exploring Stocks of Top Fortune 500 Companies"),
  pickerInput(
    inputId = "ticker",
    label = "Choose Stock Symbol(s)", 
    choices = c("WMT", "AMZN", "AAPL", "CVS","UNH","MCK","ABC","GOOGL","XOM")
  ),
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
