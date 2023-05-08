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
#library(ggplot2)

# Define server logic required to draw a histogram
function(input, output, session) {

  presslog_isu <- AmesPD::presslog_isu


  map_df <- reactive({

  presslog_isu <- subset(presslog_isu,
                           Date.Time.Reported >= input$minimum_date &
                             Date.Time.Reported <= input$maximum_date)


    if(input$disposition != 'All') {
      presslog_isu <- subset(presslog_isu, Disposition == input$disposition)
    }

    if(input$classification != 'All') {
      presslog_isu <- subset(presslog_isu, Classification == input$classification)
    }

   presslog_isu
  })



  output$ourmap <- renderLeaflet({
    leaflet() %>%
      addProviderTiles(providers$Esri.WorldImagery,
                       options = providerTileOptions(noWrap = FALSE)
      ) %>%
    addMarkers(lng = map_df()$longitude,
               lat = map_df()$latitude,
               clusterOptions = markerClusterOptions())
  })



}
