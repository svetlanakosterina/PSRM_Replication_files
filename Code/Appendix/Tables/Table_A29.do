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
use "$dir/Data/matched_20km_AB_R3_R4.dta", clear

*------------------------------------------------------------------------------
* TABLE A29
*------------------------------------------------------------------------------

logit dif_roads vote_npp_pres akan_30km_l_p eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb, robust  
logit dif_schools vote_npp_pres akan_30km_l_p eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb, robust 
logit dif_health vote_npp_pres akan_30km_l_p eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb, robust 



