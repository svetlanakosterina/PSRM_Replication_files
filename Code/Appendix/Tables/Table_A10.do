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
* TABLE A10
*------------------------------------------------------------------------------

keep if careful != . 
keep if political_intimidation_af != .

*Scale policy items, using dummy variables for each categorical response. Does not include roll calls.
qui foreach var of varlist careful_o pol {
 local tempvarlabel : var label `var'
 di "working on `var' with label `tempvarlabel'"
 levelsof `var', local(levels) missing
 local ctr=1
 foreach value of local levels {
  local templabel : label (`var') `value'
  gen td_`var'_`ctr'=0
  replace td_`var'_`ctr'=1 if (`var'==`value')
  label var td_`var'_`ctr' "`tempvarlabel' = `templabel'"
  local ctr=`ctr'+1
  }
**  drop td_`var'_1
 }

drop td_careful_o_1 td_political_intimidation_af_1
factor td_*, ipf
factor td_*, ipf factors(1)
predict polcare
drop td_*
qui summ polcare
replace polcare = ((polcare -`r(min)')/(`r(max)'-`r(min)')-.5)*2
table polcare
drop polcare 

factor careful_o political_intimidation_af, ipf
factor careful_o political_intimidation_af, ipf factors(1)
predict polcare
qui summ polcare
replace polcare = ((polcare -`r(min)')/(`r(max)'-`r(min)')-.5)*2
table polcare

label var polcare "Factor"


*------------------------------------------------------------------------------
* TABLE A10
*------------------------------------------------------------------------------
	* all areas, 5km:
logit vote_npp_pres akan_5km_l_p polcare c.akan_5km_l_p#c.polcare eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb , robust cluster(fid0725) 
	* rural areas, 30km:
logit vote_npp_pres akan_5km_l_p polcare c.akan_5km_l_p#c.polcare eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central if urb==0 , robust cluster(fid0725) 
	* urban areas, 30km:
logit vote_npp_pres akan_5km_l_p polcare c.akan_5km_l_p#c.polcare eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 if urb==1 , robust cluster(fid0725) 

