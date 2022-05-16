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
* TABLE A9
*------------------------------------------------------------------------------

	* all areas, 5km:
logit vote_npp_pres akan_5km_l_p political_intimidation_af c.akan_5km_l_p#c.political_intimidation_af careful_o c.akan_5km_l_p#c.careful_o c.careful_o#c.political_intimidation_af c.akan_5km_l_p#c.careful_o#c.political_intimidation_af eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb , robust cluster(fid0725) 
	* rural areas, 5km:
logit vote_npp_pres akan_5km_l_p political_intimidation_af c.akan_5km_l_p#c.political_intimidation_af careful_o c.akan_5km_l_p#c.careful_o c.careful_o#c.political_intimidation_af c.akan_5km_l_p#c.careful_o#c.political_intimidation_af eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central if urb==0 , robust cluster(fid0725) 
	* urban areas, 5km:
logit vote_npp_pres akan_5km_l_p political_intimidation_af c.akan_5km_l_p#c.political_intimidation_af careful_o c.akan_5km_l_p#c.careful_o c.careful_o#c.political_intimidation_af c.akan_5km_l_p#c.careful_o#c.political_intimidation_af eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 if urb==1 , robust cluster(fid0725) 
