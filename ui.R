#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(leaflet)
# Define UI for application that draws a histogram
fluidPage(

    # Application title
    titlePanel("New York City Motor Vehicle Collisions 2021-2022"),
    textOutput("explanation"),
    # Sidebar with a slider input for number of bins
    sliderInput("blur", "Adjust Blur of Heatmap", min = 1, max = 50, value = 40),
        # Show a plot of the generated distribution
        mainPanel(
          leafletOutput("map")
        ),
    textOutput("datasource")
    
)
