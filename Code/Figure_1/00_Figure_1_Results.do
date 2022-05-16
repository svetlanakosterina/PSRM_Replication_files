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
* Produce Numbers for Figure 1
*------------------------------------------------------------------------------

*------------------------------------------------------------------------------
* Model 1
*------------------------------------------------------------------------------

* Share of Akans: Low
logit vote_npp_pres akan_30km_l_p eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb , robust cluster(fid0725) 

qui summarize akan_30km_l_p, det
eststo m0: margins, at(akan_30km_l_p = (`r(p25)') (mean) economy_oneyear poverty dev_factor2 (median)  male central urb eth_akan eth_ewe eth_dagomba) post

esttab m0 using "$dir/Data/data_figure_1.csv", se noobs nostar wide noparentheses replace

* Share of Akans: High
logit vote_npp_pres akan_30km_l_p eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb , robust cluster(fid0725) 

qui summarize akan_30km_l_p, det
eststo m1: margins, at(akan_30km_l_p = (`r(p75)') (mean) economy_oneyear poverty dev_factor2 (median)  male central urb eth_akan eth_ewe eth_dagomba) post

esttab m1 using "$dir/Data/data_figure_1.csv", se noobs nostar wide noparentheses append

*------------------------------------------------------------------------------
* Model 2
*------------------------------------------------------------------------------

* Share of Akans: Low
logit vote_npp_pres akan_30km_l_p political_intimidation_af c.akan_30km_l_p#c.political_intimidation_af eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb , robust cluster(fid0725) 

qui summarize akan_30km_l_p, det
eststo m2: margins, at(akan_30km_l_p = (`r(p25)') political_intimidation_af = (0 1 2 3) (mean) economy_oneyear poverty dev_factor2 (median) male central urb eth_akan eth_ewe eth_dagomba) post

esttab m2 using "$dir/Data/data_figure_1.csv", se noobs nostar wide noparentheses append

* Share of Akans: High
logit vote_npp_pres akan_30km_l_p political_intimidation_af c.akan_30km_l_p#c.political_intimidation_af eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb , robust cluster(fid0725) 

qui summarize akan_30km_l_p, det
eststo m3: margins, at(akan_30km_l_p = (`r(p75)') political_intimidation_af = (0 1 2 3) (mean) economy_oneyear poverty dev_factor2 (median) male central urb eth_akan eth_ewe eth_dagomba) post

esttab m3 using "$dir/Data/data_figure_1.csv", se noobs nostar wide noparentheses append

*------------------------------------------------------------------------------
* Model 3
*------------------------------------------------------------------------------

* Share of Akans: Low
logit vote_npp_pres akan_30km_l_p careful_o c.akan_30km_l_p#c.careful_o eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb , robust cluster(fid0725) 

qui summarize akan_30km_l_p, det
eststo m4: margins, at(akan_30km_l_p = (`r(p25)') careful_o = (0 1 2 3) (mean) economy_oneyear poverty dev_factor2 (median) male central urb eth_akan eth_ewe eth_dagomba) post

esttab m4 using "$dir/Data/data_figure_1.csv", se noobs nostar wide noparentheses append

* Share of Akans: High
logit vote_npp_pres akan_30km_l_p careful_o c.akan_30km_l_p#c.careful_o eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb , robust cluster(fid0725) 

qui summarize akan_30km_l_p, det
eststo m5: margins, at(akan_30km_l_p = (`r(p75)') careful_o = (0 1 2 3) (mean) economy_oneyear poverty dev_factor2 (median) male central urb eth_akan eth_ewe eth_dagomba) post

esttab m5 using "$dir/Data/data_figure_1.csv", se noobs nostar wide noparentheses append

*------------------------------------------------------------------------------
* Model 4
*------------------------------------------------------------------------------

*----------------------------------------------------------------------------
* a. Intimidation: Not at all, Careful: Never
*----------------------------------------------------------------------------

* Share of Akans: Low
logit vote_npp_pres akan_30km_l_p political_intimidation_af c.akan_30km_l_p#c.political_intimidation_af careful_o c.akan_30km_l_p#c.careful_o c.careful_o#c.political_intimidation_af c.akan_30km_l_p#c.careful_o#c.political_intimidation_af eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb , robust cluster(fid0725) 

qui summarize akan_30km_l_p, det
eststo m6: margins, at(akan_30km_l_p = (`r(p25)') careful_o = (0) political_intimidation_af = (0) (mean) economy_oneyear poverty dev_factor2 (median) male central urb eth_akan eth_ewe eth_dagomba) post

esttab m6 using "$dir/Data/data_figure_1.csv", se noobs nostar wide noparentheses append

* Share of Akans: High
logit vote_npp_pres akan_30km_l_p political_intimidation_af c.akan_30km_l_p#c.political_intimidation_af careful_o c.akan_30km_l_p#c.careful_o c.careful_o#c.political_intimidation_af c.akan_30km_l_p#c.careful_o#c.political_intimidation_af eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb , robust cluster(fid0725) 

qui summarize akan_30km_l_p, det
eststo m7: margins, at(akan_30km_l_p = (`r(p75)') careful_o = (0) political_intimidation_af = (0) (mean) economy_oneyear poverty dev_factor2 (median) male central urb eth_akan eth_ewe eth_dagomba) post

esttab m7 using "$dir/Data/data_figure_1.csv", se noobs nostar wide noparentheses append

*----------------------------------------------------------------------------
* b. Intimidation: Not at all, Careful: Always
*----------------------------------------------------------------------------

* Share of Akans: Low
logit vote_npp_pres akan_30km_l_p political_intimidation_af c.akan_30km_l_p#c.political_intimidation_af careful_o c.akan_30km_l_p#c.careful_o c.careful_o#c.political_intimidation_af c.akan_30km_l_p#c.careful_o#c.political_intimidation_af eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb , robust cluster(fid0725) 

qui summarize akan_30km_l_p, det
eststo m8: margins, at(akan_30km_l_p = (`r(p25)') careful_o = (3) political_intimidation_af = (0) (mean) economy_oneyear poverty dev_factor2 (median) male central urb eth_akan eth_ewe eth_dagomba) post

esttab m8 using "$dir/Data/data_figure_1.csv", se noobs nostar wide noparentheses append

* Share of Akans: High
logit vote_npp_pres akan_30km_l_p political_intimidation_af c.akan_30km_l_p#c.political_intimidation_af careful_o c.akan_30km_l_p#c.careful_o c.careful_o#c.political_intimidation_af c.akan_30km_l_p#c.careful_o#c.political_intimidation_af eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb , robust cluster(fid0725) 

qui summarize akan_30km_l_p, det
eststo m9: margins, at(akan_30km_l_p = (`r(p75)') careful_o = (3) political_intimidation_af = (0) (mean) economy_oneyear poverty dev_factor2 (median) male central urb eth_akan eth_ewe eth_dagomba) post

esttab m9 using "$dir/Data/data_figure_1.csv", se noobs nostar wide noparentheses append

*----------------------------------------------------------------------------
* c. Intimidation: A lot, Careful: Never
*----------------------------------------------------------------------------

* Share of Akans: Low
logit vote_npp_pres akan_30km_l_p political_intimidation_af c.akan_30km_l_p#c.political_intimidation_af careful_o c.akan_30km_l_p#c.careful_o c.careful_o#c.political_intimidation_af c.akan_30km_l_p#c.careful_o#c.political_intimidation_af eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb , robust cluster(fid0725) 

qui summarize akan_30km_l_p, det
eststo m10: margins, at(akan_30km_l_p = (`r(p25)') careful_o = (0) political_intimidation_af = (3) (mean) economy_oneyear poverty dev_factor2 (median) male central urb eth_akan eth_ewe eth_dagomba) post

esttab m10 using "$dir/Data/data_figure_1.csv", se noobs nostar wide noparentheses append

* Share of Akans: High
logit vote_npp_pres akan_30km_l_p political_intimidation_af c.akan_30km_l_p#c.political_intimidation_af careful_o c.akan_30km_l_p#c.careful_o c.careful_o#c.political_intimidation_af c.akan_30km_l_p#c.careful_o#c.political_intimidation_af eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb , robust cluster(fid0725) 

qui summarize akan_30km_l_p, det
eststo m11: margins, at(akan_30km_l_p = (`r(p75)') careful_o = (0) political_intimidation_af = (3) (mean) economy_oneyear poverty dev_factor2 (median) male central urb eth_akan eth_ewe eth_dagomba) post

esttab m11 using "$dir/Data/data_figure_1.csv", se noobs nostar wide noparentheses append

*----------------------------------------------------------------------------
* d. Intimidation: A lot, Careful: Always
*----------------------------------------------------------------------------

* Share of Akans: Low
logit vote_npp_pres akan_30km_l_p political_intimidation_af c.akan_30km_l_p#c.political_intimidation_af careful_o c.akan_30km_l_p#c.careful_o c.careful_o#c.political_intimidation_af c.akan_30km_l_p#c.careful_o#c.political_intimidation_af eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb , robust cluster(fid0725) 

qui summarize akan_30km_l_p, det
eststo m12: margins, at(akan_30km_l_p = (`r(p25)') careful_o = (3) political_intimidation_af = (3) (mean) economy_oneyear poverty dev_factor2 (median) male central urb eth_akan eth_ewe eth_dagomba) post

esttab m12 using "$dir/Data/data_figure_1.csv", se noobs nostar wide noparentheses append

* Share of Akans: High
logit vote_npp_pres akan_30km_l_p political_intimidation_af c.akan_30km_l_p#c.political_intimidation_af careful_o c.akan_30km_l_p#c.careful_o c.careful_o#c.political_intimidation_af c.akan_30km_l_p#c.careful_o#c.political_intimidation_af eth_akan eth_ewe eth_dagomba male economy_oneyear poverty dev_factor2 central urb , robust cluster(fid0725) 

qui summarize akan_30km_l_p, det
eststo m13: margins, at(akan_30km_l_p = (`r(p75)') careful_o = (3) political_intimidation_af = (3) (mean) economy_oneyear poverty dev_factor2 (median) male central urb eth_akan eth_ewe eth_dagomba) post

esttab m13 using "$dir/Data/data_figure_1.csv", se noobs nostar wide noparentheses append


