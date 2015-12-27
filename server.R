statedata <- read.csv("state-ethnicity-2014.csv", stringsAsFactors = FALSE)
library(googleVis)
library(dplyr)

## Create Server
server <- function(input, output){
  
      output$view <- renderGvis({
        gvisGeoChart(statedata, locationvar = "State", colorvar = input$dropdown, options=list(region="US", displayMode="regions", resolution="provinces", width=800, height=500))
        })
 
###CREATE WHITE CALCULATION
  
  output$statewhite <- renderText({
    st <- filter(statedata, State==input$state)
    statewhite <- st$White    
    paste("State:", statewhite)
    
  })
  
  output$USwhite <- renderText({
    USwhite <- 62
    st <- filter(statedata, State==input$state)
    statewhite <- st$White
    test <- (statewhite/USwhite)*100  
    paste("Index to US:", round(test))
    
  })

  output$statewhiterank <- renderText({
    st <- filter(statedata, State==input$state)
    statewhiterank <- st$WhiteRank    
    paste("US Rank:", statewhiterank)
  
  })
  
  ###CREATE BLACK CALCULATION
  output$stateblack <- renderText({
    st <- filter(statedata, State==input$state)
    stateblack <- st$Black  
    paste("State:", stateblack)
    
  })
  
  
  output$USblack <- renderText({
    USblack <- 12
    st <- filter(statedata, State==input$state)
    stateblack <- st$Black
    test <- (stateblack/USblack)*100  
    paste("Index to US:", round(test))
    
  })


output$stateblackrank <- renderText({
  st <- filter(statedata, State==input$state)
  stateblackrank <- st$BlackRank    
  paste("US Rank:", stateblackrank)
  
})
  
  
  ###CREATE HISPANIC CALCULATION
  output$statehispanic <- renderText({
    st <- filter(statedata, State==input$state)
    statehispanic  <- st$Hispanic  
    paste("State:", statehispanic )
    
  })
  
  
  output$UShispanic <- renderText({
    UShispanic <- 18
    st <- filter(statedata, State==input$state)
    statehispanic <- st$Hispanic
    test <- (statehispanic/UShispanic)*100  
    paste("Index to US:", round(test))
    
  })
  
  output$statehispanicrank <- renderText({
    st <- filter(statedata, State==input$state)
    statehispanicrank <- st$HispanicRank    
    paste("US Rank:", statehispanicrank)
  
  })
  
  ###CREATE ASIAN CALCULATION
  output$stateasian <- renderText({
    st <- filter(statedata, State==input$state)
    stateasian  <- st$Asian  
    paste("State:", stateasian )
    
  })
  
  
  output$USasian <- renderText({
    USasian <- 6
    st <- filter(statedata, State==input$state)
    stateasian <- st$Asian
    test <- (stateasian/USasian)*100  
    paste("Index to US:", round(test))
    
  })
  
  output$stateasianrank <- renderText({
    st <- filter(statedata, State==input$state)
    stateasianrank <- st$AsianRank    
    paste("US Rank:", stateasianrank)
  
  })

}