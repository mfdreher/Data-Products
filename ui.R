library(shiny)

statenames <- c("Alabama","Alaska","Arizona", "Arkansas","California","Colorado",
                "Connecticut","Delaware","District of Columbia", "Florida",
                "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", 
                "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", 
                "Maryland", "Massachusetts", "Michigan", "Minnesota", 
                "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada",
                "New Hampshire", "New Jersey", "New Mexico", "New York", 
                "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon",
                "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", 
                "Tennessee", "Texas", "Utah", "Vermont","Virginia", "Washington", 
                "West Virginia", "Wisconsin", "Wyoming")

ethnic <- c("White", "Black", "Hispanic", "Asian")


ui <- fluidPage(
  
  tabsetPanel(
    
    ## First Panel #############################################################################
    tabPanel("Instructions",
             
             fluidRow(
               column(2),
               column(8,titlePanel("Ethnicity/Race by State")),
               column(2)
             ),
             
             fluidRow(
               column(2),
               column(8,helpText("Use the tabs above to select which calculation to perform.")),
               column(2)
             ),
             
             fluidRow(
               column(2),
               column(8,helpText("US Map: select an ehtnicity to generate a map of the United States. States will be color coded by percent of the total state population the selected ethnicity/race represents. The darker the green, the higher the porportion.")),
               column(2)
             ),
             
             fluidRow(
               column(2),
               column(8,helpText("State Calculations: select a state to generate calculations for each ethnicity/race.")),
               column(2)
             ),
             
             fluidRow(
               column(2),
               column(8,helpText("Data was taken from Kaiser Family Foundation estimates based on the Census Bureau's March 2015 Current Population Survey. http://kff.org/other/state-indicator/distribution-by-raceethnicity" )),
               column(2)
             )
             
             
    ), 
    
    ## Second Panel #############################################################################
    tabPanel("US Map",
             
             fluidRow(
               column(1),
               column(4,selectInput("dropdown", label = h3("Select Ethnicity"), choices = ethnic)),
               column(7)
             ),
             
             fluidRow(
              column(12, htmlOutput("view"))
              )
             
    ),
    
    ## last Panel #############################################################################
    tabPanel("State Calculations",
             
             fluidRow(
               column(12, h1("State View"))
             ),
             
             fluidRow(
               column(12, selectInput("state", "Choose a State:", choices = statenames))
             ),
             
             ##SPACER ROW
             
             fluidRow( 
               column(12, div(style = "height:20px"))
             ),
             
             
             fluidRow(
               column(3, h4("White Population %")),
               column(3, h4("Black Population %")),
               column(3, h4("Hispanic Population %")),
               column(3, h4("Asian Population %"))
             ),
             
             fluidRow(
               column(3, textOutput("statewhite")),
               column(3, textOutput("stateblack")),
               column(3, textOutput("statehispanic")),
               column(3, textOutput("stateasian"))
             ),
             
             fluidRow(
               column(3, h5("US: 62")),
               column(3, h5("US: 12")),
               column(3, h5("US: 18")),
               column(3, h5("US: 6"))
             ),
             
             fluidRow(
               column(3, textOutput("USwhite")),
               column(3, textOutput("USblack")),
               column(3, textOutput("UShispanic")),
               column(3, textOutput("USasian"))
             ),
             
             fluidRow(
               column(3, textOutput("statewhiterank")),
               column(3, textOutput("stateblackrank")),
               column(3, textOutput("statehispanicrank")),
               column(3, textOutput("stateasianrank"))
             ),
             
             ##SPACER ROW
             
             fluidRow( 
               column(12, div(style = "height:50px"))
             ),
             
             fluidRow(
               column(12, h5("CALCULATION KEY"))
             ),
             
             fluidRow(
               column(12, h6("State: ethnicity/race's percent of state population"))
             ),
             
             fluidRow(
               column(12, h6("US: ethnicity/race's percent of US population"))
             ),
             
             fluidRow(
               column(12, h6("Index to US: state's percent of population divided by US percent of population. 100 = state's percent equals US percent of population"))
             ),
             
             fluidRow(
               column(12, h6("Rank: State's rank for each Race/Ethnicity compatred to all other US states/District of Columbia.  1=highest proportion of that race; 50=lowest proportion"))
             )
             
             
    ) ## end panels
  ) ## end tabsetPanel   
) ## end fluidPage and ui