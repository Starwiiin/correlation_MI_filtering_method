#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

#library(ggplot2)


#resslog_isu <- AmesPD::presslog_isu

# Define UI for application that draws a histogram
fluidPage(
  # Application title
  titlePanel("Some Cool Title!"),

  # Sidebar with a slider input for the number of bins
  sidebarPanel(
    fileInput("file1", "Upload your X_train",
              accept = c(
                "text/csv",
                "text/comma-separated-values,text/plain",
                ".csv")),



    fileInput("file2", "Upload your y_train",
              accept = c(
                "text/csv",
                "text/comma-separated-values,text/plain",
                ".csv")),


    fileInput("file3", "Upload your X_test",
              accept = c(
                "text/csv",
                "text/comma-separated-values,text/plain",
                ".csv")),


    sliderInput("MI_threshold_LB", "MI threshold lower bound", min = 0, max = 1, value = 0.00001),

    sliderInput("MI_threshold_UB", "MI threshold upper bound", min = 0, max = 1, value = 0.1),

    sliderInput("MI_threshold_step", "MI threshold step", min = 0, max = 1, value = 0.005),

    sliderInput("cor_threshold", "Correlation threshold", min = 0, max = 1, value = 0.95),


    sliderInput("cor_threshold_LB", "Correlation threshold lower bound", min = 0, max = 1, value = 0.6),

    sliderInput("cor_threshold_UB", "Correlation threshold upper bound", min = 0, max = 1, value = 0.97),

    sliderInput("cor_threshold_step", "Correlation threshold step", min = 0, max = 1, value = 0.05),
  ),

  mainPanel("main panel",
            plotOutput("plot1"),
            plotOutput("plot2")
  ),

)






