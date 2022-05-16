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

** To reproduce this table you need to install boottest:
** ssc install boottest, replace

*------------------------------------------------------------------------------
* TABLE A39
*------------------------------------------------------------------------------

insheet using "$dir/Data/IchinoNathan_APSR_pollingstation_data.csv", clear

replace npp2008ps_pres_p = "." if npp2008ps_pres_p == "NA"
replace ndc2008ps_pres_p = "." if ndc2008ps_pres_p == "NA"
replace totalvotes2008ps_pres = "." if totalvotes2008ps_pres == "NA"
destring, replace

* district dummies
tab c230_id_h, gen(district_fe)
rename district_fe1 district_rfe /* Reference district */

* Interaction: 
gen interaction = akan_30km_l_p*akan_p_poly
gen logtot = log(totalvotes)

global model1 = "npp2008ps_pres_p akan_p_poly moledagbon_p_poly otherethn_p_poly public_semipublic_p dev_factor2 district_fe*" 
global model2 = "npp2008ps_pres_p akan_p_poly moledagbon_p_poly otherethn_p_poly public_semipublic_p dev_factor2 akan_30km_l_p district_fe*"
global model3 = "npp2008ps_pres_p akan_p_poly moledagbon_p_poly otherethn_p_poly public_semipublic_p dev_factor2 akan_30km_l_p interaction district_fe*"

* Traditional clustering

reg $model1 [w = logtot], cluster(c230_id_h)
reg $model2 [w = logtot], cluster(c230_id_h)
reg $model3 [w = logtot], cluster(c230_id_h)

* Clustered bootstrap fails: there is no variation in the X's

*reg $model1, vce(bootstrap, seed(22)) cluster(c230_id_h)
*reg $model2, vce(bootstrap, seed(22)) cluster(c230_id_h)
*reg $model3, vce(bootstrap, seed(22)) cluster(c230_id_h)

* However the number of clusters is small 22
* Instead we use Wild Bootstrap as Implemented by Cameron, Gelbach and Miller

regress $model1 [w = totalvotes], cluster(c230_id_h) 
boottest akan_p_poly, reps(1200)
boottest moledagbon_p_poly, reps(1200)
boottest otherethn_p_poly, reps(1200)
boottest public_semipublic_p, reps(1200) 
boottest dev_factor2, reps(1200)

regress $model2 [w = totalvotes], cluster(c230_id_h)
boottest akan_p_poly, reps(1200)
boottest moledagbon_p_poly, reps(1200)
boottest otherethn_p_poly, reps(1200)
boottest public_semipublic_p, reps(1200) 
boottest dev_factor2, reps(1200)
boottest akan_30km_l_p, reps(1200)


regress $model3 [w = totalvotes], cluster(c230_id_h)
boottest akan_p_poly, reps(1200)
boottest moledagbon_p_poly, reps(1200)
boottest otherethn_p_poly, reps(1200)
boottest public_semipublic_p, reps(1200) 
boottest dev_factor2, reps(1200)
boottest akan_30km_l_p, reps(1200)
boottest interaction, reps(1200)

