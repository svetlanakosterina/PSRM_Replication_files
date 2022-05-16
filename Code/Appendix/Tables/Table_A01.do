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
* TABLE A1
*------------------------------------------------------------------------------

*------------------------------------------------------------------------------
* Descriptive Statistics
*------------------------------------------------------------------------------

summ vote_npp_pres ///
	 akan_5km_l_p  ///
	 akan_30km_l_p ///
	 eth_akan eth_ewe eth_dagomba ///
	 male ///
	 economy_oneyear poverty urb central dev_factor2 ///
	 political_intimidation_af careful_o ///
	 health_clinic_af school_af road_af ///
	 pres mp council [iw = withinwt]
