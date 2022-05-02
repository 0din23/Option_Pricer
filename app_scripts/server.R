########################################################################
# SERVER #
########################################################################

server_fun <- function(input, output, session) {

  # innit ----------------------------------------------------------------------
  repV <- reactiveValues(
  )

  ## Seite 1 ###################################################################
  observeEvent(input$CHAIN_load,{

    repV$qm_Chain <- getOptionChain(input$CHAIN_SYM, input$CHAIN_EXP)
    repV$calls <- repV$qm_Chain[["calls"]] %>%
      select(Expiration, Strike, Last, Bid, Ask, Vol, OI, IV, ITM) %>%
      mutate(ITM = if_else(ITM, "Yes", "No"))
    repV$puts <- repV$qm_Chain[["puts"]] %>%
      select(Expiration, Strike, Last, Bid, Ask, Vol, OI, IV, ITM) %>%
      mutate(ITM = if_else(ITM, "Yes", "No"))

    ## Construct Chain
    output$Call_Chain <- renderReactable(
      reactable(repV$calls)
    )
    output$Put_Chain <- renderReactable(
      reactable(repV$puts)
    )

  })
}
