library(shiny)
library(shinyWidgets)
library(shinydashboard)
library(quantmod)
library(plotly)
library(DT)
library(shinythemes)
SYMBOLS <- stockSymbols()

ui <- shinyUI(dashboardPage(
  skin="red",
  dashboardHeader(title="Exploring Stocks"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard",tabName="dashboard",icon=icon("dashboard")),
      menuItem("Data Table", tabName="dtstock",icon=icon("th")),
      menuItem("What If?", tabName="whatif",icon=icon("question"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName="dashboard",
              fluidRow(
                box(
                  title=h3("What Stock Do You Want to Explore?"),width=4,background="black",
                           selectInput("ticker",h3("Select a Stock Symbol"),
                                       choices= names(table(SYMBOLS$Symbol)),
                                       selected = 1),
                           verbatimTextOutput("value")
                           ),
                  box(
                    title=h3("What Date Range Do You Want to Explore?"),width=4,background="green",
                    dateInput("start","Choose a Start Date",value="1900-01-01",startview="month"),
                    dateInput("end","Choose an End Date",value="2022-03-07",startview="month")
                  ),
                box(
                  title=h3("Is This a Top 10 Fortune 500 Company?"),width=4,background="blue",
                  paste("Click the link to view this stock on Nasdaq."),
                  htmlOutput("mySite"),
                  verbatimTextOutput("position")
                )
                ),
              fluidRow(
                box(
                  title=h3("Plot of Closing Prices"), width=12,
                  materialSwitch(
                    inputId = "diff",
                    label = "Difference?",
                    status="primary",
                    right = TRUE),
                  plotOutput("plot",height=300)
                )
              )
              ),
      tabItem(tabName="dtstock",
              h3("Data Table of Stock Values"),
              DT::dataTableOutput("view")
              ),
      tabItem(tabName="whatif",
              h3("What if..."),
              numericInput(
                "amt",
                "I invested this much money (in USD)",
                10,
                min=1),
              dateInput("invest","on this date:",value="2020-03-07",startview="month"),
              strong(paste("in this stock, and sold it")),
              dateInput("sell","on this date?", value="2022-03-07",startview="month"),
              strong(paste("Answer: I would have made")),
              verbatimTextOutput("money")
              )
      )
    )
  )
)
  
  
  
