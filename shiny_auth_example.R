library(shiny)
library(magrittr)

.appv <- reactiveValues(logged_in = FALSE)

view <- fluidPage(
  h1("itchy ibex"),
  actionButton("in_and_out", "sign in or out"),
  uiOutput("secret"),
  style = "font-family: ubuntu;"
)

controller <- function(input, output){
  observeEvent(input$in_and_out, {
    print(.appv$logged_in)
    .appv$logged_in %<>% ifelse(FALSE, TRUE)
  })
  
  output$secret <- renderUI({
    if(.appv$logged_in){
      list(
        tableOutput("main")
      )
    } 
  })
  
  output$main <- renderTable({
      quakes[1:5, ]
  })
}

shinyApp(view, controller)