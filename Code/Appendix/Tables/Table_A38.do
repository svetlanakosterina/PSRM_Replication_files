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
* TABLE A38
*------------------------------------------------------------------------------

*------------------------------------------------------------------------------
* Model 4
*------------------------------------------------------------------------------

logit vote_npp_pres akan_30km_l_p political_intimidation_af c.akan_30km_l_p#c.political_intimidation_af careful_o c.akan_30km_l_p#c.careful_o c.careful_o#c.political_intimidation_af c.akan_30km_l_p#c.careful_o#c.political_intimidation_af eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb , robust cluster(fid0725) 

margins, dydx(akan_30km_l_p) at(careful_o = (0) political_intimidation_af = (0) (mean) economy_oneyear poverty dev_factor2 (median) male central urb eth_akan eth_ewe eth_dagomba)

margins, dydx(akan_30km_l_p) at(careful_o = (1) political_intimidation_af = (0) (mean) economy_oneyear poverty dev_factor2 (median) male central urb eth_akan eth_ewe eth_dagomba)

margins, dydx(akan_30km_l_p) at(careful_o = (2) political_intimidation_af = (0) (mean) economy_oneyear poverty dev_factor2 (median) male central urb eth_akan eth_ewe eth_dagomba)

margins, dydx(akan_30km_l_p) at(careful_o = (3) political_intimidation_af = (0) (mean) economy_oneyear poverty dev_factor2 (median) male central urb eth_akan eth_ewe eth_dagomba)

margins, dydx(akan_30km_l_p) at(careful_o = (0) political_intimidation_af = (1) (mean) economy_oneyear poverty dev_factor2 (median) male central urb eth_akan eth_ewe eth_dagomba)

margins, dydx(akan_30km_l_p) at(careful_o = (1) political_intimidation_af = (1) (mean) economy_oneyear poverty dev_factor2 (median) male central urb eth_akan eth_ewe eth_dagomba)

margins, dydx(akan_30km_l_p) at(careful_o = (2) political_intimidation_af = (1) (mean) economy_oneyear poverty dev_factor2 (median) male central urb eth_akan eth_ewe eth_dagomba)

margins, dydx(akan_30km_l_p) at(careful_o = (3) political_intimidation_af = (1) (mean) economy_oneyear poverty dev_factor2 (median) male central urb eth_akan eth_ewe eth_dagomba)

margins, dydx(akan_30km_l_p) at(careful_o = (0) political_intimidation_af = (2) (mean) economy_oneyear poverty dev_factor2 (median) male central urb eth_akan eth_ewe eth_dagomba)

margins, dydx(akan_30km_l_p) at(careful_o = (1) political_intimidation_af = (2) (mean) economy_oneyear poverty dev_factor2 (median) male central urb eth_akan eth_ewe eth_dagomba)

margins, dydx(akan_30km_l_p) at(careful_o = (2) political_intimidation_af = (2) (mean) economy_oneyear poverty dev_factor2 (median) male central urb eth_akan eth_ewe eth_dagomba)

margins, dydx(akan_30km_l_p) at(careful_o = (3) political_intimidation_af = (2) (mean) economy_oneyear poverty dev_factor2 (median) male central urb eth_akan eth_ewe eth_dagomba)

margins, dydx(akan_30km_l_p) at(careful_o = (0) political_intimidation_af = (3) (mean) economy_oneyear poverty dev_factor2 (median) male central urb eth_akan eth_ewe eth_dagomba)

margins, dydx(akan_30km_l_p) at(careful_o = (1) political_intimidation_af = (3) (mean) economy_oneyear poverty dev_factor2 (median) male central urb eth_akan eth_ewe eth_dagomba)

margins, dydx(akan_30km_l_p) at(careful_o = (2) political_intimidation_af = (3) (mean) economy_oneyear poverty dev_factor2 (median) male central urb eth_akan eth_ewe eth_dagomba)

margins, dydx(akan_30km_l_p) at(careful_o = (3) political_intimidation_af = (3) (mean) economy_oneyear poverty dev_factor2 (median) male central urb eth_akan eth_ewe eth_dagomba)
