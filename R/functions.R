################################################################################
# Pricing #
################################################################################
Option_price <- function(TYPE, EXP, STRIKE, STK, VOL, DIV){

  # Parameters

  ## Expiration Stuff
  TODAY <- Sys.Date()
  days2exp <- as.numeric(EXP-TODAY)
  EXP <- yearFraction(TODAY,EXP,dayCounter = 1)

  ## RF
  getSymbols.FRED("DGS10", env = .GlobalEnv)
  DGS10 <- last(DGS10)/100/360
  Rf <- sum(rep(DGS10,days2exp))

  # Pricing
  if(TYPE == "Call"){
    res <- greeks(bscall(s=STK,k=STRIKE,v=VOL,r=Rf,tt=EXP,d=DIV))
  } else{
    res <- greeks(bsput(s=STK,k=STRIKE,v=VOL,r=Rf,tt=EXP,d=DIV))
  }

  res
}
