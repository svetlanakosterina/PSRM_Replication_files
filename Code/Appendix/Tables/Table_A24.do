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
* TABLE A24
*------------------------------------------------------------------------------

	* all areas, 30km:
logit vote_npp_pres akan_30km_l_p health_clinic_af c.akan_30km_l_p#c.health_clinic_af eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb , robust cluster(fid0725) 
	* all areas, 5km:
logit vote_npp_pres akan_5km_l_p health_clinic_af c.akan_5km_l_p#c.health_clinic_af eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb , robust cluster(fid0725) 
* 2 interactions:
	* all areas, 30km:
logit vote_npp_pres akan_30km_l_p political_intimidation_af  c.akan_30km_l_p#c.political_intimidation_af health_clinic_af c.akan_30km_l_p#c.health_clinic_af eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb , robust cluster(fid0725) 
	* all areas, 5km:
logit vote_npp_pres akan_5km_l_p political_intimidation_af c.akan_5km_l_p#c.political_intimidation_af health_clinic_af c.akan_5km_l_p#c.health_clinic_af eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb , robust cluster(fid0725) 
