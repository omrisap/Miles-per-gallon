#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
data("mtcars")

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
    # Application title
    titlePanel("Miles per gallons"),
    
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            
            radioButtons("xa",
                         "MPG vs ?",
                         c("disp","wt","qsec","hp")),
            headerPanel("filter"),
            sliderInput("cyl", "cyl:", 
                        min = 4, max = 8, value = 6, step= 2),
            checkboxInput("am", "am", FALSE),
            textOutput("am")
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot")
    )
  )
))
