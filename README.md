# StockAssignment475_Group

This is a shiny app that looks at stocks from NASDAQ and analyzes them. Initially when you open the app, you have the option to select a stock symbol, or ticker, of any stock that you desire to look at. After you have selected the stock that you would like to look at, you must enter the start and end date of the period in which you hope to analyze. If you do not select a start or end date, it is automatically set to 1900-01-01 as the start date and 2022-03-07 as the end date. Once you have selected the stock, start date, and end date, you will be able to see if the selected stock is a Top 10 Fortune 500 company, as well as the link to the NASDAQ website corresponding to the selected stock. 

Additionally, there will be a graph of closing price that appears for the selected stock that allows you to look at closing price over the time period in which you selected. There is also an option to difference this graph, which removes the trend and allows you to see the difference of closing prices. Below this graph of closing price, you will see a table. This table will also correspond to the selected stock and show its opening price, high price, low price, close price, volume, and adjusted price. If you have selected a start date, this will be the first entry in the table. Also, you are able to select the amount of entries that you would like displayed in the table. The options for number of entries are 10, 25, 50, or 100.

Finally, there is a "what-if" feature to this shiny app. This feature allows you to enter a dollar amount (in USD) that you could have possibly invested in this company as well as what date you would have invested and what date you would have sold it. From these three inputs, you are able to see the amount (in USD) that you would have made if you invested that certain amount of money on a certain day and sold it on a certain day. 