#http://www.bmi-calculator.net/bmr-calculator/harris-benedict-equation/
#http://www.bmi-calculator.net/bmr-calculator/bmr-formula.php
BMR <- function(age,weight,height,sex) {
    if(sex == "female"){
      655 + (4.35*weight) + (4.7*height) - (4.7*age)
    } else if (sex == "male") {
      66 + (6.23*weight) + (12.7*height) - (6.8*age)
    }
}

shinyServer(
  function(input, output) {
    output$bmr <- renderPrint({BMR(input$age,input$weight,input$height,input$sex)})
    output$calories <- renderPrint({BMR(input$age,input$weight,input$height,input$sex)}*{as.numeric(input$activity)})
  }
)