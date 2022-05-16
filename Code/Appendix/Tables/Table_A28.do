** ------------------------------------------------------------------------------
**
** Replication Code for: 
** Surrounded and Threatened: How Neighborhood Composition Reduces 
** Ethnic Voting Through Intimidation
**
** Authors: Ted Enamorado & Svetlana Kosterina
** Date: 10/04/2020
**
** ------------------------------------------------------------------------------


*------------------------------------------------------------------------------
* DO-Files, Main Analysis
*------------------------------------------------------------------------------
use "$dir/Data/DHS_matched_20km.dta", clear

*------------------------------------------------------------------------------
* TABLE A28
*------------------------------------------------------------------------------

logit delivery vote_npp_pres akan_30km_l_p eth_akan eth_ewe eth_dagomba male economy_oneyear v190 dev_factor2 central urb, robust 
logit delivery vote_npp_pres akan_5km_l_p eth_akan eth_ewe eth_dagomba male economy_oneyear v190 dev_factor2 central urb, robust 

logit antenatal vote_npp_pres akan_30km_l_p eth_akan eth_ewe eth_dagomba male economy_oneyear v190 dev_factor2 central urb, robust 
logit antenatal vote_npp_pres akan_5km_l_p eth_akan eth_ewe eth_dagomba male economy_oneyear v190 dev_factor2 central urb, robust 





