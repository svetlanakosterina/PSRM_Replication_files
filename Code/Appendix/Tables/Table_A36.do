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
* TABLE A36
*------------------------------------------------------------------------------

* 1
logit vote_npp_pres akan_30km_l_p i.political_intimidation_af c.akan_30km_l_p#political_intimidation_af eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb , robust cluster(fid0725) 

* 2
logit vote_npp_pres akan_30km_l_p i.political_intimidation_af c.akan_30km_l_p#political_intimidation_af eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb school_af c.akan_30km_l_p#school_af, robust cluster(fid0725) 

* 3
logit vote_npp_pres akan_30km_l_p i.political_intimidation_af c.akan_30km_l_p#political_intimidation_af eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb c.akan_30km_l_p#road_af road_af, robust cluster(fid0725) 

* 4
logit vote_npp_pres akan_30km_l_p i.political_intimidation_af c.akan_30km_l_p#political_intimidation_af eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb  c.akan_30km_l_p#health_clinic_af health_clinic_af, robust cluster(fid0725) 
