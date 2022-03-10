library(shiny)

server <- shinyServer(function(input, output) {
    output$stok <- renderPrint({paste(input$ticker, "is the symbol for", SYMBOLS$Name[SYMBOLS$Symbol==input$ticker])})
    
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
      else if(input$ticker == "BRK-A" | input$ticker == "BRK-B"){
        "Berkshire Hathaway is currently the #6 Fortune 500 Company. Click the link above to view this stock on Nasdaq."}
      else if(input$ticker == "MCK"){
        "McKesson is currently the #7 Fortune 500 Company. Click the link above to view this stock on Nasdaq."} 
      else if(input$ticker == "ABC"){
        "AmerisourceBergen is currently the #8 Fortune 500 Company. Click the link above to view this stock on Nasdaq."} 
      else if(input$ticker == "GOOGL"){
        "Alphabet is currently the #9 Fortune 500 Company. Click the link above to view this stock on Nasdaq."} 
      else if(input$ticker == "XOM"){
        "Exxon Mobil is currently the #10 Fortune 500 Company. Click the link above to view this stock on Nasdaq."}
      else {
        "This stock is not a Top 10 Fortune 500 Company. Click the link above to view this stock on Nasdaq."}
    })
    
    web <- reactive({
      paste("https://www.nasdaq.com/market-activity/stocks/",input$ticker,sep="")
      
    })
    
    output$mySite <- renderUI({
      tags$a(href = web(), web())
    }) 
    
    output$plot <- renderPlot({
      if(input$diff == "FALSE"){
      data= getSymbols(input$ticker,
                       from=input$start,
                       to=input$end,
                       auto.assign=FALSE
                       )
      chartSeries(data[,4])
      } else{
      data= getSymbols(input$ticker,
                       from=input$start,
                       to=input$end,
                       auto.assign=FALSE)
      plot(diff(log(data[,4])))
    }
    
  })
  
   dataInput <- reactive({
     getSymbols(input$ticker, src = "yahoo",
                from = input$start,
                to=input$end,
                auto.assign= FALSE)
   }) 
   output$view <- DT::renderDataTable({
     as.data.frame(dataInput())
   })
   
  dataInput2 <- reactive({
    getSymbols(input$ticker, src = "yahoo",
               from= input$invest,
               to= input$sell,
               auto.assign= FALSE)
  })
  open <- reactive({
    as.data.frame(dataInput2()[1,1])
  })
  close <- reactive({
    as.data.frame(dataInput2()[nrow(as.data.frame(dataInput2())),4])
  })
  
  output$money <- renderPrint({
    paste(((input$amt/open() * close()) - ((input$amt/open()) * open())))
  })
  
} )
    
  shinyApp(ui=ui,server=server) 
