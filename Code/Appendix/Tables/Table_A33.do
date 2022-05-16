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
* TABLE A33
*------------------------------------------------------------------------------

logit vote_npp_pres akan_30km_l_p council c.akan_30km#c.council eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb , robust cluster(fid0725) 
logit vote_npp_pres akan_30km_l_p council c.akan_30km#c.council political_intimidation_af  c.akan_30km_l_p#c.political_intimidation_af careful_o c.akan_30km_l_p#c.careful_o c.careful_o#c.political_intimidation_af c.akan_30km_l_p#c.careful_o#c.political_intimidation_af eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb , robust cluster(fid0725) 
logit vote_npp_pres akan_30km_l_p mp c.akan_30km#c.mp eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb , robust cluster(fid0725) 
logit vote_npp_pres akan_30km_l_p mp c.akan_30km#c.mp political_intimidation_af  c.akan_30km_l_p#c.political_intimidation_af careful_o c.akan_30km_l_p#c.careful_o c.careful_o#c.political_intimidation_af c.akan_30km_l_p#c.careful_o#c.political_intimidation_af eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb , robust cluster(fid0725) 
logit vote_npp_pres akan_30km_l_p pres c.akan_30km#c.pres eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb , robust cluster(fid0725) 
logit vote_npp_pres akan_30km_l_p pres c.akan_30km#c.pres political_intimidation_af  c.akan_30km_l_p#c.political_intimidation_af careful_o c.akan_30km_l_p#c.careful_o c.careful_o#c.political_intimidation_af c.akan_30km_l_p#c.careful_o#c.political_intimidation_af eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb , robust cluster(fid0725) 
