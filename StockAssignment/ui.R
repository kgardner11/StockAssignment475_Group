library(shiny)
library(shinyWidgets)
library(quantmod)
library(plotly)
library(DT)
SYMBOLS <- stockSymbols()

ui <- shinyUI(fluidPage(
  titlePanel("Exploring Stocks and the What-If"),
  img(src = "stockim.png", height = 100, width = 300),
  selectInput("ticker",h3("Select a Stock Symbol"),
              choices= names(table(SYMBOLS$Symbol)),
              selected = 1),
  fluidRow(column(3, verbatimTextOutput("value"))),
  
  dateInput("start","Choose a Start Date",value="1900-01-01",startview="month"),
  dateInput("end","Choose an End Date",value="2022-03-07",startview="month"),
  materialSwitch(
    inputId = "diff",
    label = "Difference?",
    status="primary",
    right = TRUE
  ),
  htmlOutput("mySite"),
  verbatimTextOutput("stok"),
  verbatimTextOutput("position"),
  plotOutput("plot"),
  DT::dataTableOutput("view"),
  numericInput(
    "amt",
    "If I invested this much money (in USD)",
    10,
    min=1),
  dateInput("invest","on this date:",value="2020-03-07",startview="month"),
  strong(paste("in this stock, and sold it")),
  dateInput("sell","on this date:", value="2022-03-07",startview="month"),
  verbatimTextOutput("money")
  )
) 

