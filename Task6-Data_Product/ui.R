#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

# loading the required packages
library(shiny)
library(tidyverse)
library(stringr)

# Source ngram matching function
source("Creative Exploration.R")

# Define UI for application that draws a histogram
ui <- fluidPage(
    
    # Application title
    titlePanel("Text Prediction Model"),
    p("This app that takes an input phrase in a text box and outputs a prediction of the next word."),
    
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            h2("Instructions:"), 
            h5("1. Enter a word or words in the text box."),
            h5("2. The predicted next word prints below it in blue."),
            h5("3. No need to hit enter of submit."),
            h5("4. A question mark means no prediction, typically due to mis-spelling"),
            h5("5. Additional tabs show plots of the top ngrams in the dataset"),
            br(),
            a("Source Code", href = "https://github.com/ruchirasena/ruchirasena.github.io/tree/master/Task6-Data_Product")
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            tabsetPanel(
                tabPanel("Predict Next Word",
                         textInput("user_input", h3("Your Input:"), 
                                   value = "Enter Your Word Here"),
                         br(),
                         actionButton("click","Predict Next Word"),
                         h3(span(textOutput("ngram_output"), style="color:black"))),
                
                tabPanel("Top Bigrams",
                         br(),
                         img(src = "bigrams.png", height = 800, width = 1000)),
                
                tabPanel("Top Trigrams",
                         br(),       
                         img(src = "trigrams.png", height = 800, width = 1000)),
                
                tabPanel("Top Quadgrams",
                         br(),
                         img(src = "quadgrams.png", height = 800, width = 1000))
                
            )   
        )
    )
)
