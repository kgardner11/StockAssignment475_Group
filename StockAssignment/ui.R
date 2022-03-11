library(shiny)
library(shinyWidgets)
library(quantmod)
library(plotly)
library(DT)
library(shinythemes)
library(shinydashboard)
library(dygraphs)
library(ggplot2)
SYMBOLS <- stockSymbols()

ui <- dashboardPage(dashboardHeader(title="Exploring Stocks"),
                    dashboardSidebar(id="",sidebarMenu(
                      
                      menuItem(menuSubItem("Chose Your Stock",tabName = "STO")),
                      menuItem(text="Stock Market News", icon = icon("send",lib='glyphicon'), href = "https://www.marketwatch.com/latest-news?mod=home-page"),
                      menuItem(text="Fun Zone",icon=icon("line-chart"),
                               
                               menuSubItem("Plotting!",tabName = "ST1"),
                               menuSubItem("Stock Data Table",tabName = "ST2"),
                               menuSubItem("How Much Money??",tabName = "ST3")))),
                    dashboardBody(
                      tabItems(
                        tabItem(tabName = "STO",selectInput("ticker",h3("Select a Stock Symbol"),
                                                            choices= names(table(SYMBOLS$Symbol)),
                                                            selected = 1), fluidRow(column(3, verbatimTextOutput("value"))),
                                dateInput("start","Choose a Start Date",value="1900-01-01",startview="month"),
                                dateInput("end","Choose an End Date",value="2022-03-07",startview="month"),
                                verbatimTextOutput("position"),
                                htmlOutput("mySite")
                                
                        ),
                        tabItem(tabName = "ST1",materialSwitch(
                          inputId = "diff",
                          label = "Difference?",
                          status="primary",
                          right = TRUE
                        ),
                        verbatimTextOutput("stok"),
                        plotOutput("plot")),
                        tabItem(tabName = "ST2",DT::dataTableOutput("view")),
                        tabItem(tabName = "ST3",
                                numericInput(
                                  "amt",
                                  "If I invested this much money (in USD)",
                                  10,
                                  min=1),
                                dateInput("invest","on this date:",value="2020-03-07",startview="month"),
                                strong(paste("in this stock, and sold it")),
                                dateInput("sell","on this date:", value="2022-03-07",startview="month"),
                                strong(paste("I would have made")),
                                verbatimTextOutput("money")
                        ))))


