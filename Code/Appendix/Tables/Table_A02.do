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
* TABLE A2
*------------------------------------------------------------------------------

*------------------------------------------------------------------------------
* Predicted Probabilities:
*------------------------------------------------------------------------------

*------------------------------------------------------------------------------
* Model 1
*------------------------------------------------------------------------------

capture program drop my_margins
program define my_margins, eclass
	logit vote_npp_pres akan_30km_l_p eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb [pw = withinwt], robust cluster(fid0725) 
	margins, dydx(akan_30km_l_p) at((mean) economy_oneyear poverty dev_factor2 (median) male central urb eth_akan eth_ewe eth_dagomba) post
    exit
end

bootstrap _b, reps(500) seed(1234): my_margins 

*------------------------------------------------------------------------------
* Model 2
*------------------------------------------------------------------------------

capture program drop my_margins
program define my_margins, eclass
	logit vote_npp_pres akan_30km_l_p political_intimidation_af c.akan_30km_l_p#c.political_intimidation_af eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb [pw = withinwt], robust cluster(fid0725) 
	margins, dydx(akan_30km_l_p) at(political_intimidation_af = (0 1 2 3) (mean) economy_oneyear poverty dev_factor2 (median) male central urb eth_akan eth_ewe eth_dagomba) post
    exit
end

bootstrap _b, reps(500) seed(1234): my_margins 

*------------------------------------------------------------------------------
* Model 3
*------------------------------------------------------------------------------
 
capture program drop my_margins
program define my_margins, eclass
	logit vote_npp_pres akan_30km_l_p careful_o c.akan_30km_l_p#c.careful_o eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb [pw = withinwt], robust cluster(fid0725) 
	margins, dydx(akan_30km_l_p) at(careful_o = (0 1 2 3) (mean) economy_oneyear poverty dev_factor2 (median) male central urb eth_akan eth_ewe eth_dagomba) post
    exit
end

bootstrap _b, reps(500) seed(1234): my_margins 

wgttest vote_npp_pres akan_30km_l_p eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb, wgt(withinwt)


*------------------------------------------------------------------------------
* Model 4
*------------------------------------------------------------------------------

capture program drop my_margins
program define my_margins, eclass
	logit vote_npp_pres akan_30km_l_p political_intimidation_af c.akan_30km_l_p#c.political_intimidation_af careful_o c.akan_30km_l_p#c.careful_o c.careful_o#c.political_intimidation_af c.akan_30km_l_p#c.careful_o#c.political_intimidation_af eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb [pw = withinwt], robust cluster(fid0725) 
	margins, dydx(akan_30km_l_p) at(careful_o = (0) political_intimidation_af = (0) (mean) economy_oneyear poverty dev_factor2 (median) male central urb eth_akan eth_ewe eth_dagomba) post
    exit
end

bootstrap _b, reps(500) seed(1234): my_margins 


capture program drop my_margins
program define my_margins, eclass
	logit vote_npp_pres akan_30km_l_p political_intimidation_af c.akan_30km_l_p#c.political_intimidation_af careful_o c.akan_30km_l_p#c.careful_o c.careful_o#c.political_intimidation_af c.akan_30km_l_p#c.careful_o#c.political_intimidation_af eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb [pw = withinwt], robust cluster(fid0725) 
	margins, dydx(akan_30km_l_p) at(careful_o = (3) political_intimidation_af = (0) (mean) economy_oneyear poverty dev_factor2 (median) male central urb eth_akan eth_ewe eth_dagomba) post
    exit
end

bootstrap _b, reps(500) seed(1234): my_margins 


capture program drop my_margins
program define my_margins, eclass
	logit vote_npp_pres akan_30km_l_p political_intimidation_af c.akan_30km_l_p#c.political_intimidation_af careful_o c.akan_30km_l_p#c.careful_o c.careful_o#c.political_intimidation_af c.akan_30km_l_p#c.careful_o#c.political_intimidation_af eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb [pw = withinwt], robust cluster(fid0725) 
	margins, dydx(akan_30km_l_p) at(careful_o = (0) political_intimidation_af = (3) (mean) economy_oneyear poverty dev_factor2 (median) male central urb eth_akan eth_ewe eth_dagomba) post
    exit
end

bootstrap _b, reps(500) seed(1234): my_margins 


capture program drop my_margins
program define my_margins, eclass
	logit vote_npp_pres akan_30km_l_p political_intimidation_af c.akan_30km_l_p#c.political_intimidation_af careful_o c.akan_30km_l_p#c.careful_o c.careful_o#c.political_intimidation_af c.akan_30km_l_p#c.careful_o#c.political_intimidation_af eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb [pw = withinwt], robust cluster(fid0725) 
	margins, dydx(akan_30km_l_p) at(careful_o = (3) political_intimidation_af = (3) (mean) economy_oneyear poverty dev_factor2 (median) male central urb eth_akan eth_ewe eth_dagomba) post
    exit
end

bootstrap _b, reps(500) seed(1234): my_margins 
