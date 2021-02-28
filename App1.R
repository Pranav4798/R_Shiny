library(shiny)

Uinter <- fluidPage(
  titlePanel("My simple application"),
  
  sidebarLayout(
    sidebarPanel(helpText("Controls for My Application"),
                 selectInput("ChoiceOfFruits",
                              label ="Select a fruit",
                              choices = list("Pomogranate","Grapes","Apples","Oranges","Bananas"),
                              selected = 'Percent White'),
                 sliderInput("order", "Order Amount",min=0, max=100, value=1),
                 actionButton("go","Update order")
),
  
      mainPanel(
        helpText("Fruit Chosen"),
        verbatimTextOutput("fruit"),
        helpText("Order Amount"),
        verbatimTextOutput("order")
    ) 
  )
)

server <- function(input,output){
  output$fruit = renderText({
    input$go
    isolate(input$ChoiceOfFruits)
  })
  output$order <- renderText({
    input$go
    isolate(input$order)
  })
}

shinyApp(ui = Uinter, server = server)
