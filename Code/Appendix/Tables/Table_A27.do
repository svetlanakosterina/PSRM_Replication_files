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
use "$dir/Data/Afrobarometer_data_R4_public_goods.dta", clear

*------------------------------------------------------------------------------
* TABLE A27
*------------------------------------------------------------------------------

* Roads
	* all areas, 30km:
logit road_af vote_npp_pres akan_30km_l_p eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb, robust
	* all areas, 5km:
logit road_af vote_npp_pres akan_5km_l_p eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb, robust

* Schools
	* all areas, 30km:
logit school_af vote_npp_pres akan_30km_l_p eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb, robust 
	* all areas, 5km:
logit school_af vote_npp_pres akan_5km_l_p eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb, robust 

* Health clinics:
	* all areas, 30km:
logit health_clinic_af vote_npp_pres akan_30km_l_p eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb, robust  
	* all areas, 5km:
logit health_clinic_af vote_npp_pres akan_5km_l_p eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb, robust  

