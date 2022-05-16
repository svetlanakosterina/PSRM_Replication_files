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
* TABLE A35
*------------------------------------------------------------------------------

* Councilor
	* all areas, 30km:
reg council_l vote_npp_pres akan_30km_l_p eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb, robust

* MP
reg mp_l vote_npp_pres akan_30km_l_p eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb, robust

* Presidential Approval
reg pres_a vote_npp_pres akan_30km_l_p eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb, robust
