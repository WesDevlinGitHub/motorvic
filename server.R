#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(leaflet)
library(geojsonio)
library(leaflet.extras)
library(dplyr)

# Define server logic required to draw a histogram
server <- function(input, output, session) {
  output$explanation <- renderText({
    "This is a heatmap of NYC Motor Vehicle Collisions from 2021-2022.
    Adjust the slider bar below to modify the bluriness of the heatmap."
  })
  output$datasource <- renderText({
    "Data Source: https://data.cityofnewyork.us/Public-Safety/Motor-Vehicle-Collisions-Crashes/h9gi-nx95"
  })
  data <- read.csv('./data/Motor_Vehicle_Collisions_-_Crashes.csv')
  df <- na.omit(data)
  # Create the leaflet map object
  output$map <- renderLeaflet({
    map()
  })
  # Add the heatmap layer to the map
  map <- reactive({
    leaflet() %>% addTiles() %>% setView(lng = -74.0060, lat = 40.7128, zoom = 8) %>%
      addHeatmap(data = df,lat = ~LATITUDE, lng = ~LONGITUDE, blur = input$blur) %>% addFullscreenControl()
  })

}
