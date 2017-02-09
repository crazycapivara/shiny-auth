library(shiny)

keys <- list(
  "1234" = "dog",
  "8989" = "rabbit"
)

.appv <- reactiveValues(
  username = "nobody"
)

main_view <- function(username){
  list(
    pre(sprintf("Hi %s, welcome to the machine!", username)),
    tableOutput("main")
  )
}

check_key <- function(query){
  key <- query[["key"]]
  if(!is.null(key) && key %in% names(keys)){
    .appv$username <- keys[[key]]
    return(TRUE)
  }
  FALSE
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
    if(check_key(query)){
      main_view(.appv$username)  
    } else {
      pre("Pass API key!")
    }
  })
  
  output$main <- renderTable({
      quakes[1:5, ]
  })
}

shinyApp(view, controller)