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
* TABLE A31
*------------------------------------------------------------------------------

logit vote_npp_pres akan_30km_l_p council c.akan_30km#c.council eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb , robust cluster(fid0725) 
logit vote_npp_pres akan_30km_l_p council c.akan_30km#c.council careful_o c.akan_30km_l_p#c.careful_o eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb , robust cluster(fid0725) 
logit vote_npp_pres akan_30km_l_p mp c.akan_30km#c.mp eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb, robust cluster(fid0725) 
logit vote_npp_pres akan_30km_l_p mp c.akan_30km#c.mp careful_o c.akan_30km_l_p#c.careful_o eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb , robust cluster(fid0725) 
logit vote_npp_pres akan_30km_l_p pres c.akan_30km#c.pres eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb , robust cluster(fid0725) 
logit vote_npp_pres akan_30km_l_p pres c.akan_30km#c.pres careful_o c.akan_30km_l_p#c.careful_o eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb , robust cluster(fid0725) 
