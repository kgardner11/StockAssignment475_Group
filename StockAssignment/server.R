library(shiny)

server <- shinyServer(function(input, output) {
    output$stok <- renderPrint({input$ticker})
    
    output$position <- renderPrint({
      if(input$ticker == "WMT"){
        "Walmart is currently the #1 Fortune 500 Company. Click the link above to view this stock on Nasdaq."} 
      else if(input$ticker == "AMZN"){
        "Amazon is currently the #2 Fortune 500 Company. Click the link above to view this stock on Nasdaq."} 
      else if(input$ticker == "AAPL"){
        "Apple is currently the #3 Fortune 500 Company. Click the link above to view this stock on Nasdaq."} 
      else if(input$ticker == "CVS"){
        "CVS Health is currently the #4 Fortune 500 Company. Click the link above to view this stock on Nasdaq. "} 
      else if(input$ticker == "UNH"){
        "UnitedHealth Group is currently the #5 Fortune 500 Company. Click the link above to view this stock on Nasdaq."} 
      else if(input$ticker == "MCK"){
        "McKesson is currently the #7 Fortune 500 Company. Click the link above to view this stock on Nasdaq."} 
      else if(input$ticker == "ABC"){
        "AmerisourceBergen is currently the #8 Fortune 500 Company. Click the link above to view this stock on Nasdaq."} 
      else if(input$ticker == "GOOGL"){
        "Alphabet is currently the #9 Fortune 500 Company. Click the link above to view this stock on Nasdaq."} 
      else {
        "Exxon Mobil is currently the #10 Fortune 500 Company. Click the link above to view this stock on Nasdaq."}
    })
    
    web <- reactive({
      if(input$ticker == "WMT"){
        "https://www.nasdaq.com/market-activity/stocks/wmt"} 
      else if(input$ticker == "AMZN"){
        "https://www.nasdaq.com/market-activity/stocks/amzn"} 
      else if(input$ticker == "AAPL"){
        "https://www.nasdaq.com/market-activity/stocks/aapl"} 
      else if(input$ticker == "CVS"){
        "https://www.nasdaq.com/market-activity/stocks/cvs"} 
      else if(input$ticker == "UNH"){
        "https://www.nasdaq.com/market-activity/stocks/unh"} 
      else if(input$ticker == "MCK"){
        "https://www.nasdaq.com/market-activity/stocks/mck"} 
      else if(input$ticker == "ABC"){
        "https://www.nasdaq.com/market-activity/stocks/abc"} 
      else if(input$ticker == "GOOGL"){
        "https://www.nasdaq.com/market-activity/stocks/googl"} 
      else {
        "https://www.nasdaq.com/market-activity/stocks/xom"}
      
    })
    
    output$mySite <- renderUI({
      tags$a(href = web(), web())
    }) 
    
    y <- reactive({getSymbols(input$ticker, src = "yahoo", auto.assign = F)})
    
    x <-reactive({
      if (input$term == "Weekly") {
        x <- to.weekly(y())
      }
      else if (input$term == "Monthly") {
        x <- to.monthly(y())
      }
      else {
        x <- y()
      }
      return(x)
    })
    
    output$chart <- renderPlot({
      
      chartSeries(x())
    })
    
  } )
  
  shinyApp(ui=ui,server=server) 
