library(highcharter)
library(shinyalert)
library(collapsibleTree)
library(shinydashboard)
library(shinycssloaders)

statuspage <- function()tagList(
  sidebarLayout(
    sidebarPanel(width = 2,
                 uiOutput("status_sidebar")
                 ),
    mainPanel(
       tabsetPanel(id="overview_status", 
         tabPanel("Current details",
                  div(
                    uiOutput('currentTitle'),
                             
                    highchartOutput("current_Activities", height = "400px")), br(),br(),
                           
                  box(width = 12, status = "primary", fill = T, tags$p(style = "color: #FF8C00; font-size: 20px; text-align: center;", "Expanded accession details"),
                      column(12, offset = 11,
                      downloadBttn("download_current_details")),
                      #div(style = c('overflow-x: scroll', "font-size: 100%; width: 80%"),
                                       DT::dataTableOutput("current_Table")#), br()
                  )
         ),
         
         tabPanel("Data flow",
                  fluidRow(
                    tags$p(style = "color: #FF8C00; font-size: 25px; text-align: center;",
                   "Collapsible plot of all accessions recorded"), br(),
                    collapsibleTreeOutput("overviewPlot", height = "500px"),

                    br(),br(),
                    box(width = 12,
                        wellPanel(
                          tags$p(style = "color: #FF8C00; font-size: 18px; text-align: center;","Expanded details"),
                          column(12, offset = 11,downloadBttn("download_data_flow",size="sm")),
                          DT::dataTableOutput("collapsed_table"), br()
                        )
                      )
                    )
                  ),
         tabPanel("Lost information",
                  fluidRow(br(),
                    tags$p(style = "color: #FF8C00; font-size: 18px; text-align: center;",
                           "This page shows the accessions which have being dropped from tracking as a result reports of status or contaminations"), br(),
                    column(12,offset = 11, 
                           downloadBttn("downloadLost", size = "sm")), br(),
                    DT::dataTableOutput("lostTbl"), br()
                  )
              )
       )
    )
  )
)
