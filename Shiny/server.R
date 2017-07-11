#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    output$am <- renderText({
"
        --------[, 1]	 mpg	 Miles/(US) gallon--------
        --------[, 2]	 cyl	 Number of cylinders------
        --------[, 3]	 disp	 Displacement (cu.in.)---
        --------[, 4]	 hp	 Gross horsepower---------
        --------[, 5]	 drat	 Rear axle ratio-----------
        --------[, 6]	 wt	 Weight (1000 lbs)----------
        --------[, 7]	 qsec	 1/4 mile time------------
        --------[, 8]	 vs	 V/S---------------------------
        ---[, 9]	 am	 (0 = automatic, 1 = manual)
        ---[,10]	 gear	 Number of forward gears--
        ---[,11]	 carb	 Number of carburetors----"
        })
    
    output$distPlot <- renderPlot({
        
        # generate bins based on input$bins from ui.R
        cyla <- as.numeric(input$cyl)
        
        ama <- as.numeric(input$am)
        all <- subset(mtcars,cyl<=cyla)
        all    <- subset(all,am==ama)
        y <- all[,"mpg"]
        x <- all[,input$xa]
        # bins <- seq(min(x), max(x), length.out = input$bins + 1)
        
        # draw the histogram with the specified number of bins
        plot(x,y,xlab=input$xa,ylab="Miles per gallon")
        abline(lm(y~x))
        
    })
    
})
