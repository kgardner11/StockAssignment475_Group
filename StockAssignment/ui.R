library(shiny)
library(shinyWidgets)
library(quantmod)


ui <- shinyUI(fluidPage(
  titlePanel("Exploring Stocks of Top Fortune 500 Companies"),
  img(src = "logo.png", height = 100, width = 300),
  pickerInput(
    inputId = "ticker",
    label = "Choose Stock Symbol(s)", 
    choices = c("WMT", "AMZN", "AAPL", "CVS","UNH","MCK","ABC","GOOGL","XOM")
  ),
  dateInput("start","Choose a Start Date",value="1900-01-01",startview="month"),
  dateInput("end","Choose an End Date",value="2022-03-07",startview="month"),
  htmlOutput("mySite"),
  verbatimTextOutput("stok"),
  verbatimTextOutput("position"),
  plotOutput("plot"),
  )
)

