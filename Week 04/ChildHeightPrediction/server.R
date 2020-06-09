# loading the required packages
# for this application we use the GaltonFamilies dataset
library(shiny)
library(HistData)
library(dplyr)
library(ggplot2)
data(GaltonFamilies)

# converting inches to centimeters
galton <- GaltonFamilies
galton <- galton %>% 
    mutate(father=father*2.54,
           mother=mother*2.54,
           childHeight=childHeight*2.54)

# creating the linear model
# we are going to predict the child's height based on the gender and parent's average height
# so,the dependent variable is child's height and the independent variables are 
# gender of the child and the average height of the parents
model1 <- lm(childHeight ~ father + mother + gender, data=galton)

shinyServer(function(input, output) {
    output$pText <- renderText({paste("This child's father's height is",
                                      strong(round(input$inFh, 1)),
                                      "cm, and mother's height is",
                                      strong(round(input$inMh, 1)),"cm, then:")})
    
    output$pred <- renderText({
        df <- data.frame(father=input$inFh,
                         mother=input$inMh,
                         gender=factor(input$inGen, levels=levels(galton$gender)))
        ch <- predict(model1, newdata=df)
        kid <- ifelse(input$inGen=="female","Daugther","Son")
        paste0(em(strong(kid)),
               "'s predicted height is going to be around ",
               em(strong(round(ch))), " cm")})
    
    output$Plot <- renderPlot({kid <- ifelse(input$inGen=="female","Daugther","Son")
        df <- data.frame(father=input$inFh,
                         mother=input$inMh,
                         gender=factor(input$inGen, levels=levels(galton$gender)))
        ch <- predict(model1, newdata=df)
        yvals <- c("Father", kid, "Mother")
        df <- data.frame(x = factor(yvals, levels = yvals, ordered = TRUE),
                         y = c(input$inFh, ch, input$inMh))
        ggplot(df, aes(x=x, y=y)) +
            geom_bar(stat="identity", width=0.5, fill=c("Red", "green", "blue")) +
            xlab("") +
            ylab("Height (cm)") +
            theme_minimal() +
            theme(legend.position = "none")
    })
})