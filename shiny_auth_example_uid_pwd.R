library(shiny)

secrets <- list(
  bird = "dog"
)

login_panel <- function(){
  wellPanel(
    textInput("username", "username"),
    passwordInput("password", "password"),
    actionButton("sign_in", "sign in"),
    style = "width: 300px;"
  )
}

main_view <- function(username){
  list(
    pre(sprintf("Hi %s, welcome to the machine!", username)),
    actionButton("sign_out", "sign out"),
    tableOutput("main")
  )
}

check_login <- function(username, password){
   if(username %in% names(secrets) && secrets[[username]] == password){
     return(TRUE)
   }
  FALSE
}

.appv <- reactiveValues(
  logged_in = FALSE
)

view <- fluidPage(
  h1("itchy ibex"),
  uiOutput("secret"),
  style = "font-family: ubuntu;"
)

controller <- function(input, output){
  observeEvent(input$sign_in, {
    print(input$username)
    if(check_login(input$username, input$password)){
      .appv$logged_in <- TRUE
    }
  })
  
  observeEvent(input$sign_out, {
    .appv$logged_in <- FALSE
  })
  
  output$secret <- renderUI({
    if(.appv$logged_in){
      main_view(input$username)
    } else {
      login_panel()
    }
  })
  
  output$main <- renderTable({
      quakes[1:5, ]
  })
}

shinyApp(view, controller, options = list(port = 5141))