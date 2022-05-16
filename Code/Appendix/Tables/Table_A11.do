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
use "$dir/Data/Afrobarometer_data_R4.dta", clear

*------------------------------------------------------------------------------
* TABLE A11
*------------------------------------------------------------------------------

logit vote_npp_pres akan_30km_l_p careful_o c.akan_30km_l_p#c.careful_o eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb if eth_akan == 0 , robust cluster(fid0725) 
logit vote_npp_pres akan_5km_l_p careful_o c.akan_5km_l_p#c.careful_o eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb if eth_akan == 0 , robust cluster(fid0725) 
logit vote_npp_pres akan_30km_l_p careful_o c.akan_30km_l_p#c.careful_o eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb if eth_akan == 1 , robust cluster(fid0725) 
logit vote_npp_pres akan_5km_l_p careful_o c.akan_5km_l_p#c.careful_o eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb if eth_akan == 1 , robust cluster(fid0725) 
