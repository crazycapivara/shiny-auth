library(shiny)

keys <- list(
  "1234" = "dog",
  "8989" = "rabbit"
)

user_data <- list(
  "dog" = iris[1:5, ],
  "rabbit" = quakes[1:5, ]
)

.appv <- reactiveValues(
  username = "nobody"
)

main_view <- function(){
  list(
    pre(sprintf("Hi %s, welcome to the machine!", .appv$username)),
    tableOutput("main")
  )
}

check_key <- function(key){
  if(!is.null(key) && key %in% names(keys)){
    .appv$username <- keys[[key]]
    return(main_view())
  }
  pre("Pass api key!")
}

view <- fluidPage(
  h1("itchy ibex"),
  uiOutput("secret"),
  style = "font-family: ubuntu;"
)

controller <- function(input, output, session){
  output$secret <- renderUI({
    query <- parseQueryString(session$clientData$url_search)
    print(query[["key"]])
    check_key(query[["key"]])
  })
  
  output$main <- renderTable({
    user_data[[.appv$username]]
  })
}

shinyApp(view, controller)