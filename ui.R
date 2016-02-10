shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Basal Metabolic Rate & Daily Caloric Intake Calculator"),
    
    sidebarPanel(
      selectInput("sex", "What's your sex?", choices = c("male", "female")),
      numericInput('age', 'What is your age?', 25, min = 10, max = 100, step = 1),
      numericInput('weight', 'Enter your weight in lbs:', 150, min = 50, max = 400, step = 1),
      numericInput('height', 'Enter your height in inches:', 50, min = 20, max = 100, step = 1),
      radioButtons("activity", "Enter your activity level:", c("sedentary (little or no exercise)" = 1.2,
                     "lightly active (light exercise/sports 1-3 days/week)" = 1.375,
                     "moderatetely active (moderate exercise/sports 3-5 days/week)" = 1.55,
                     "very active (hard exercise/sports 6-7 days a week)" = 1.725,
                     "extremely active (very hard exercise & physical job)" = 1.9)),
      submitButton('Submit')
    ),
    mainPanel(
      h4('Your Basal Metabolic Rate [kcal] is:'),
      verbatimTextOutput("bmr"),
      h4('Your daily caloric intake [kcal] to maintain weight is:'),
      verbatimTextOutput("calories"),
      h4('Read Me / Documentation:'),
      p('This app calculates your basal metabolic rate (BMR) and daily energy expenditure (DEE).'),
      p('Please provide your:'),
      tags$ul(
        tags$li("sex"), 
        tags$li("age"), 
        tags$li("weight in lbs"),
        tags$li("height in inches"),
        tags$li("your activity level")
      )
    )
  )
)