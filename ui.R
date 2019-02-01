## LOADING LIBRARIES
library(shiny)

## SHINY UI
shinyUI(
  navbarPage("Developing Data Products Week 4 Project - Alvin Alon (Feb 1, 2019)",
             tabPanel("Bivariate Analysis",
                      fluidPage(
                        titlePanel("MTCars Variables vs. MPG (miles per gallon)"),
                        sidebarLayout(
                          sidebarPanel(
                            radioButtons("variable", "Select a variable to compare w/ MPG:",
                                        c("Engine - vs" = "vs",
                                          "Transmission - am" = "am",
                                          "Number of Cylinders - cyl" = "cyl",
                                          "Displacement (cu.in.) - disp" = "disp",
                                          "Gross Horsepower - hp" = "hp",
                                          "Rear Axle Ratio - drat" = "drat",
                                          "Weight (lb/1000) - wt" = "wt",
                                          "1/4 Mile Time - qsec" = "qsec",
                                          "Number of Forward Gears - gear" = "gear",
                                          "Number of Carburetors - carb" = "carb"
                                        )),
                            
                            checkboxInput("outliers", "Inlcude Outliers", FALSE)
                          ),
                          
                          mainPanel(
                            h3(textOutput("caption")),
                            
                            tabsetPanel(type = "tabs", 
                                        tabPanel("Visualization", plotOutput("mpgBoxPlot")),
                                        tabPanel("Regression", 
                                                 plotOutput("mpgPlot"),
                                                 verbatimTextOutput("fit")
                                        )
                            )
                          )
                        )
                      )
             ),
             tabPanel("Data Description",
                      h2("Motor Trend Car Road Tests"),
                      hr(),
                      h3("Description"),
                      helpText("The data was extracted from the 1974 Motor Trend US magazine, and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973–74 models)."),
                      h3("Format"),
                      p("A data frame with 32 observations on 11 variables."),
                      
                      p("  [, 1]   mpg         Miles/(US) gallon"),
                      p("  [, 2]	 cyl	 Number of cylinders"),
                      p("  [, 3]	 disp	 Displacement (cu.in.)"),
                      p("  [, 4]	 hp	 Gross horsepower"),
                      p("  [, 5]	 drat	 Rear axle ratio"),
                      p("  [, 6]	 wt	 Weight (lb/1000)"),
                      p("  [, 7]	 qsec	 1/4 mile time"),
                      p("  [, 8]	 vs	 V/S"),
                      p("  [, 9]	 am	 Transmission (0 = automatic, 1 = manual)"),
                      p("  [,10]	 gear	 Number of forward gears"),
                      p("  [,11]	 carb	 Number of carburetors"),
                      
                      h3("Note"),
                      
                      p("Henderson and Velleman (1981) comment in a footnote to Table 1: ‘Hocking [original transcriber]'s noncrucial coding of the Mazda's rotary engine as a straight six-cylinder engine and the Porsche's flat engine as a V engine, as well as the inclusion of the diesel Mercedes 240D, have been retained to enable direct comparisons to be made with previous analyses.’"),
                      
                      h3("Source"),
                      
                      p("Henderson and Velleman (1981), Building multiple regression models interactively. Biometrics, 37, 391–411.")
             ),
             tabPanel("Source Code",
                      h4("All the Source code can be found on my github"),
                      hr(),
                      a("https://github.com/engrasa/ddpweek4Project")
             )
  )
)