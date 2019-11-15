server <- function(input, output, session) {
  
  
  # Generate a plot of the data ----
  # Also uses the inputs to build the plot label. Note that the
  # dependencies on the inputs and the data reactive expression are
  # both tracked, and all expressions are called in the sequence
  # implied by the dependency graph.
  output$plot <- renderPlot({
    
    
    req(input$file1)
    
    nona <- read.csv(input$file1$datapath,header=T)
    
    if (input$radio == 1 & input$radio2 == 1) {
      hist(nona$IBU, breaks = input$bins)
    }
      else {
        if (input$radio == 2 & input$radio2 == 1) {
          hist(nona$ABV, breaks = input$bins)
        }
        else {
          if (input$radio == 1 & input$radio2 == 2) {
            boxplot(nona$IBU)
          }
          else {
            boxplot(nona$ABV)
          }
        }
    }

    dataset <- reactive({
      # Make sure requirements are met
      req(input$state)
      
      get(inpsut$state, "package:datasets", inherits = FALSE)
    })

    br()
  

  
    # dist <- input$dist
    # bins <- input$bins
    # 
    # hist(d(),
    #      main = paste("r", dist, "(", bins, ")", sep = ""),
    #      col = "#75AADB", border = "white")
  })
  
  
  # Generate a summary of the data ----
  output$summary <- renderPrint({
    summary(d())
  })
  
  # Generate an HTML table view of the data ----
  output$table <- renderTable({
    d()
  })
  
}