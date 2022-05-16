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
* change intdata to the folder where the data for the replication materials is located
use "$dir/Data/Afrobarometer_data_R4.dta", clear

*------------------------------------------------------------------------------
* Produce Numbers for Figure 2
*------------------------------------------------------------------------------


*------------------------------------------------------------------------------
* Schools
*------------------------------------------------------------------------------

logit vote_npp_pres akan_30km_l_p school_af political_intimidation_af c.akan_30km_l_p#c.school_af eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb , robust cluster(fid0725) 

eststo m0: margins, dydx(akan_30km_l_p) at(school_af = (0 1) (mean) economy_oneyear poverty dev_factor2 (median) male central urb eth_akan eth_ewe eth_dagomba) post

esttab m0 using "$dir/Data/data_figure_2.csv", se noobs nostar wide noparentheses replace

*------------------------------------------------------------------------------
* Roads
*------------------------------------------------------------------------------

logit vote_npp_pres akan_30km_l_p political_intimidation_af careful_o road_af c.akan_30km_l_p#c.road_af eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb, robust cluster(fid0725) 

eststo m1: margins, dydx(akan_30km_l_p) at(road_af = (0 1) (mean) economy_oneyear poverty dev_factor2 (median) male central urb eth_akan eth_ewe eth_dagomba) post

esttab m1 using "$dir/Data/data_figure_2.csv", se noobs nostar wide noparentheses append

*------------------------------------------------------------------------------
* Health Clinics
*------------------------------------------------------------------------------

logit vote_npp_pres akan_30km_l_p political_intimidation_af c.health_clinic_af c.akan_30km_l_p#c.health_clinic_af eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb, robust cluster(fid0725) 

eststo m2: eststo m2: margins, dydx(akan_30km_l_p) at(health_clinic_af = (0 1) (mean) political_intimidation_af economy_oneyear poverty dev_factor2 (median) male central urb eth_akan eth_ewe eth_dagomba) post

esttab m2 using "$dir/Data/data_figure_2.csv", se noobs nostar wide noparentheses append
