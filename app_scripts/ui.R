################################################################################
# UI #
################################################################################

## Seite 1----------------------------------------------------------------------
chain_ui <- function() {
  sidebarLayout(
    sidebarPanel = sidebarPanel(width = 2,
      textInput("CHAIN_SYM", "Symbol", value="AAPL"),
      textInput("CHAIN_EXP", "Expiration"),
      actionButton("CHAIN_load", "Load Chain", icon = icon("check"))
    ),
    mainPanel = mainPanel(width = 10,
      tabsetPanel(
        tabPanel("Option Chain",
                 fluidRow(
                   column(6,
                          h5("Call Chain"),
                          reactableOutput("Call_Chain")
                   ),
                   column(6,
                          h5("Put Chain"),
                          reactableOutput("Put_Chain")
                   )
                 )
        ),
        tabPanel("Basket",

        )
      )
    )
  )
}

## Seite 2----------------------------------------------------------------------
## Main UI ---------------------------------------------------------------------
main_ui <- fluidPage(
  navbarPage("Options",
             tabPanel("Option Chain",
                      chain_ui()
             ),
             tabPanel("Value Structure",
             )
  )
)

