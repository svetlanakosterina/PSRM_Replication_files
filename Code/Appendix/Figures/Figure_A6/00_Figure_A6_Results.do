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
* Produce Numbers for Figure A6
*------------------------------------------------------------------------------

*------------------------------------------------------------------------------
* Model 4
*------------------------------------------------------------------------------

* Intimidation: Not at all; Careful: Never
logit vote_npp_pres akan_30km_l_p political_intimidation_af c.akan_30km_l_p#c.political_intimidation_af careful_o c.akan_30km_l_p#c.careful_o c.careful_o#c.political_intimidation_af c.akan_30km_l_p#c.careful_o#c.political_intimidation_af eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb , robust cluster(fid0725) 

eststo m0: margins, at(akan_30km_l_p = (0 0.05 0.1 0.15 0.2 0.25 0.3 0.35 0.4 0.45 0.5 0.55 0.6 0.65 0.7 0.75 0.8 0.85 0.9 0.95 1.0) careful_o = (0) political_intimidation_af = (0) (mean) economy_oneyear poverty dev_factor2 (median)  male central urb eth_akan eth_ewe eth_dagomba) post

esttab m0 using "$dir/Data/data_figure_A6.csv", se noobs nostar wide noparentheses replace

* Intimidation: A lot; Careful: Always
logit vote_npp_pres akan_30km_l_p political_intimidation_af c.akan_30km_l_p#c.political_intimidation_af careful_o c.akan_30km_l_p#c.careful_o c.careful_o#c.political_intimidation_af c.akan_30km_l_p#c.careful_o#c.political_intimidation_af eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb , robust cluster(fid0725) 

eststo m1: margins, at(akan_30km_l_p = (0 0.05 0.1 0.15 0.2 0.25 0.3 0.35 0.4 0.45 0.5 0.55 0.6 0.65 0.7 0.75 0.8 0.85 0.9 0.95 1.0) careful_o = (3) political_intimidation_af = (3) (mean) economy_oneyear poverty dev_factor2 (median)  male central urb eth_akan eth_ewe eth_dagomba) post

esttab m1 using "$dir/Data/data_figure_A6.csv", se noobs nostar wide noparentheses append

