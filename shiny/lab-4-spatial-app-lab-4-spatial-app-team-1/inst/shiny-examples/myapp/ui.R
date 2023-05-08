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
#library(ggplot2)


presslog_isu <- AmesPD::presslog_isu

# Define UI for application that draws a histogram
fluidPage(
  # Application title
  titlePanel("Some Cool Title!"),

  # Sidebar with a slider input for the number of bins
  sidebarPanel(
    dateInput("minimum_date",
              "Minimum Date",
              min = min(as.Date(presslog_isu$Date.Time.Reported)),
              max = max(as.Date(presslog_isu$Date.Time.Reported)) - 1,
              value = min(as.Date(presslog_isu$Date.Time.Reported))),
    dateInput("maximum_date",
              "Maximum Date",
              min = min(as.Date(presslog_isu$Date.Time.Reported)) + 1,
              max = max(as.Date(presslog_isu$Date.Time.Reported)),
              value = max(as.Date(presslog_isu$Date.Time.Reported))),
    selectInput('disposition',
                'Disposition',
                choices = c('All',
                            unique(presslog_isu$Disposition)[order(unique(presslog_isu$Disposition))] )),
    selectInput('classification',
                'Classification',
                choices = c('All',
                            unique(presslog_isu$Classification)[order(unique(presslog_isu$Classification))] ))
  ),

  # Show a plot of the generated distribution
  mainPanel(
    leafletOutput("ourmap")
  )
)
