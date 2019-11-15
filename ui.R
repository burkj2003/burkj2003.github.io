library(class)
library(shiny)
library(caret)
library(ggplot2)

# Define UI for data upload app ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("Beer Data"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Select a file ----
      fileInput("file1", "Choose CSV File",
                multiple = TRUE,
                accept = c("text/csv",
                           "text/comma-separated-values,text/plain",
                           ".csv")),
      
      # Copy the line below to make a set of radio buttons
      radioButtons("radio", label = h3("IBU or ABV"),
                   choices = list("IBU" = 1, "ABV" = 2), 
                   selected = 1),
      
      
      # Copy the line below to make a set of radio buttons
      radioButtons("radio2", label = h3("Histogram or BoxPlot"),
                   choices = list("Hist" = 1, "Box" = 2), 
                   selected = 1),
      
    
      br(),
      
      selectizeInput(
        "state", "Enter a state or state(s)", choices = state.name, multiple = TRUE
      ),
      
      # Input: Slider for the number of observations to generate ----
      sliderInput(inputId = "bins",
                  label = "Number of bins for histogram:",
                  value = 100,
                  min = 1,
                  max = 200),
      
        
        ),
    

    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Data file ----
      #tableOutput(outputId = "table")
      tabsetPanel(type = "tabs",
                  tabPanel("Plot", plotOutput("plot"))
                  # tabPanel("Summary", verbatimTextOutput("summary")),
                  # tabPanel("Table", tableOutput("table"))
      )
    )
    
  )

  
)
