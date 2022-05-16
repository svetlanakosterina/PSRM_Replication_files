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

** Change this path to the path containing the replication materials in your
** computer:

global dir "~/Dropbox/00_New_Projects/Ethnic voting in Ghana/ForPSRM/ReplicationMaterials/"

log using "$dir/replication_results.log", replace

** Table Main Text:
do "$dir/Code/Table_1/Table_1.do"

** Prepare Data for Figures 1 and 2 in the Main Text:
do "$dir/Code/Figure_1/00_Figure_1_Results.do"

do "$dir/Code/Figure_2/00_Figure_2_Results.do"

** Tables Appendix:
do "$dir/Code/Appendix/Tables/Table_A01.do"

do "$dir/Code/Appendix/Tables/Table_A02.do"

do "$dir/Code/Appendix/Tables/Table_A03.do"

do "$dir/Code/Appendix/Tables/Table_A04.do"

do "$dir/Code/Appendix/Tables/Table_A05.do"

do "$dir/Code/Appendix/Tables/Table_A06.do"

do "$dir/Code/Appendix/Tables/Table_A07.do"

do "$dir/Code/Appendix/Tables/Table_A08.do"

do "$dir/Code/Appendix/Tables/Table_A09.do"

do "$dir/Code/Appendix/Tables/Table_A10.do"

do "$dir/Code/Appendix/Tables/Table_A11.do"

do "$dir/Code/Appendix/Tables/Table_A12.do"

do "$dir/Code/Appendix/Tables/Table_A13.do"

do "$dir/Code/Appendix/Tables/Table_A14.do"

do "$dir/Code/Appendix/Tables/Table_A15.do"

do "$dir/Code/Appendix/Tables/Table_A16.do"

do "$dir/Code/Appendix/Tables/Table_A17.do"

do "$dir/Code/Appendix/Tables/Table_A18.do"

do "$dir/Code/Appendix/Tables/Table_A19.do"

do "$dir/Code/Appendix/Tables/Table_A20.do"

do "$dir/Code/Appendix/Tables/Table_A21.do"

do "$dir/Code/Appendix/Tables/Table_A22.do"

do "$dir/Code/Appendix/Tables/Table_A23.do"

do "$dir/Code/Appendix/Tables/Table_A24.do"

do "$dir/Code/Appendix/Tables/Table_A25.do"

do "$dir/Code/Appendix/Tables/Table_A26.do"

do "$dir/Code/Appendix/Tables/Table_A27.do"

do "$dir/Code/Appendix/Tables/Table_A28.do"

do "$dir/Code/Appendix/Tables/Table_A29.do"

do "$dir/Code/Appendix/Tables/Table_A30.do"

do "$dir/Code/Appendix/Tables/Table_A31.do"

do "$dir/Code/Appendix/Tables/Table_A32.do"

do "$dir/Code/Appendix/Tables/Table_A33.do"

do "$dir/Code/Appendix/Tables/Table_A34.do"

do "$dir/Code/Appendix/Tables/Table_A35.do"

do "$dir/Code/Appendix/Tables/Table_A36.do"

do "$dir/Code/Appendix/Tables/Table_A37.do"

do "$dir/Code/Appendix/Tables/Table_A38.do"

do "$dir/Code/Appendix/Tables/Table_A39.do"

** Prepare Data for Figures A3--A6 in the Appendix:
do "$dir/Code/Appendix/Figures/Figure_A3/00_Figure_A3_Results.do"

do "$dir/Code/Appendix/Figures/Figure_A4/00_Figure_A4_Results.do"

do "$dir/Code/Appendix/Figures/Figure_A5/00_Figure_A5_Results.do"

do "$dir/Code/Appendix/Figures/Figure_A6/00_Figure_A6_Results.do"

log close
