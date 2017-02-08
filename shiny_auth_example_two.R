library(shiny)
library(magrittr)

secrets <- list(
  bird = "dog"
)

login_panel <- wellPanel(
  textInput("username", "username"),
  passwordInput("password", "password"),
  actionButton("in_and_out", "sign in"),
  style = "width: 300px;"
)

.appv <- reactiveValues(
  logged_in = FALSE
)

view <- fluidPage(
  h1("itchy ibex"),
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
        h2(sprintf("Hi %s", input$username)),
        actionButton("in_and_out", "sign out"),
        tableOutput("main")
      )
    } else{
      login_panel
    }
  })
  
  output$main <- renderTable({
      quakes[1:5, ]
  })
}

shinyApp(view, controller)