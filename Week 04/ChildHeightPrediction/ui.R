# loading the shiny package
library(shiny)

shinyUI(fluidPage(
    titlePanel("CHILD HEIGHT PREDICTION APPLICATION"),
    sidebarLayout(
        sidebarPanel(
            helpText("This application help you to predict the child's height based on child's 
                     gender and  child's parent's height."),
            helpText("Let's predict the child's height..."),
            helpText("Select:"),
            sliderInput(inputId = "inFh",
                        label = "The father's height (cm):",
                        value = 150,
                        min = 150,
                        max = 220,
                        step = 1),
            sliderInput(inputId = "inMh",
                        label = "The mother's height (cm):",
                        value = 140,
                        min = 140,
                        max = 200,
                        step = 1),
            radioButtons(inputId = "inGen",
                         label = "The child's gender: ",
                         choices = c("Male"="male","Female"="female"),
                         inline = TRUE)
        ),
        
        mainPanel(
            htmlOutput("pText"),
            htmlOutput("pred"),
            plotOutput("Plot", width = "50%")
        )
    )
))
