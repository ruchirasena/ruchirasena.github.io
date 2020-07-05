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
            h5("1. Enter a phrase in the text box."),
            h5("2. Click the 'Predict Next Word' button."),
            h5("3. The predicted next word will be printed below."),
            h5("4. A question mark means no prediction, typically due to mis-spelling."),
            h5("5. Additional tabs show plots of the top ngrams and wordclouds in the dataset.")
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            tabsetPanel(
                tabPanel("Predict Next Word",
                         textInput("user_input", h3("Enter Your Phrase:")),
                         br(),
                         actionButton("click","Predict Next Word"),
                         h3(span(textOutput("ngram_output")))),
                
                tabPanel("Top Ngrams",
                         tabsetPanel(
                             tabPanel("Bigrams",
                                      br(),
                                      img(src = "bigrams.png", height = 800, width = 1000)),
                             tabPanel("Trigrams",
                                      br(),  
                                      img(src = "trigrams.png", height = 800, width = 1000)),
                             tabPanel("Quadgrams",
                                      br(),
                                      img(src = "quadgrams.png", height = 800, width = 1000)),
                             tabPanel("Quintgrams",
                                      br(), 
                                      img(src = "quintgrams.png", height = 800, width = 1000)),
                             tabPanel("Sextgrams",
                                      br(),
                                      img(src = "sextgrams.png", height = 800, width = 1000))
                             )
                         ),
                
                tabPanel("Word Clouds",
                         tabsetPanel(
                             tabPanel("Bigrams",
                                      br(),
                                      img(src = "word_bigrams.png", height = 1000, width = 1000)),
                             tabPanel("Trigrams",
                                      br(),  
                                      img(src = "word_trigrams.png", height = 1000, width = 1000)),
                             tabPanel("Quadgrams",
                                      br(),
                                      img(src = "word_quadgrams.png", height = 1000, width = 1000)),
                             tabPanel("Quintgrams",
                                      br(), 
                                      img(src = "word_quintgrams.png", height = 1000, width = 1000)),
                             tabPanel("Sextgrams",
                                      br(),
                                      img(src = "word_sextgrams.png", height = 1000, width = 1000))
                         )
                )
            )  
        )
    )
)
