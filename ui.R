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
      
      hr(),
      fluidRow(column(3, verbatimTextOutput("value")))
      
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Data file ----
      #tableOutput(outputId = "table")
      plotOutput("kplot"),
      tableOutput('contents')
    )
    
  )
)
