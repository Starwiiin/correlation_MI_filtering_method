#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
#library(leaflet)
#library(ggplot2)

# Define server logic required to draw a histogram
function(input, output, session) {

  X_train = reactive({
    req(input$file1)
    read.csv(input$file1$datapath)
  })


  y_train = reactive({
    req(input$file2)
    read.csv(input$file2$datapath)
  })


  X_test = reactive({
    req(input$file3)
    read.csv(input$file3$datapath)
  })


  output$plot1 = renderPlot({




    plot1 = MI_analysis_plot(input$MI_threshold_LB,input$MI_threshold_UB,input$MI_threshold_step,X_train(),y_train(),X_test(), input$cor_threshold)

    plot1

  })




  output$plot2 = renderPlot({




    plot2 = MI_cor_plot(input$MI_threshold_LB,input$MI_threshold_UB,input$MI_threshold_step,input$cor_threshold_LB,input$cor_threshold_UB,input$cor_threshold_step,X_train(),y_train(),X_test())

    plot2

  })


}
