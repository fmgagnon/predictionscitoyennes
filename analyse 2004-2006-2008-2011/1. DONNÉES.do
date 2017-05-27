
**** SONDAGES
clear
use "sondages2004.dta"
replace joursavant = (date - 2004) / 10000
replace joursavant = 628-joursavant if joursavant > 600
replace joursavant = 559-joursavant if joursavant > 500
replace joursavant = 0-joursavant
save "sondages2004.dta", replace


clear
use "sondages2006.dta"
replace joursavant = (date - 2005) / 10000 if mod(date,2)==1
replace joursavant = (date - 2006) / 10000 if mod(date,2)==0
replace joursavant = 123-joursavant if joursavant < 1200
replace joursavant = 1254-joursavant if joursavant > 1200
replace joursavant = 1061+joursavant if joursavant < -1000
replace joursavant = 0-joursavant
save "sondages2006.dta", replace


clear
use "sondages2008.dta"
replace joursavant = (date - 2008) / 10000 
replace joursavant = 1014-joursavant if joursavant > 1000
replace joursavant = 944-joursavant if joursavant > 900
replace joursavant = 0-joursavant
save "sondages2008.dta", replace

clear
use "sondages2011.dta"
rename sondplc sond_plc
rename sondpcc sond_pcc
rename sondndp sond_npd
rename sondvert sond_pv
rename sondbq sond_bq
rename sondautre sond_autres

replace joursavant = (date - 2011) / 10000 
replace joursavant = 502-joursavant if joursavant > 500
replace joursavant = 432-joursavant if joursavant > 400
replace joursavant = 363-joursavant if joursavant > 300
replace joursavant = 0-joursavant
save "sondages2011.dta", replace


**********************************
* Preparation des donnees (2004) *
**********************************

clear
use "ces2004.dta"

keep areacode province cps_intd cps_a5 cps_q1a cps_q1b ///
	cps_ch_c cps_ch_d cps_ch_e  cps_ch_j cps_ch_k cps_ch_l ///
	cps_ch_m cps_s3 cps_e1 cps_e2 cps_e3 cps_e4 cps_know ///
	cps_kn_a cps_kn_b cps_kn_c cps_int

rename areacode indicatif
rename cps_intd date

* Variable expliquee : Predictions de (ch)ances (l)ocales et (n)ationales
recode cps_ch_c cps_ch_d cps_ch_e cps_ch_j cps_ch_k cps_ch_l cps_ch_m ///
	(995=0) (996=100) (997 998 999=.)

* Normalisation : la prediction est calculee selon le total predit pour les trois partis
egen total_chn = rowtotal(cps_ch_c cps_ch_d cps_ch_e)
	
gen chn_plc = cps_ch_c/total_chn
gen chn_pcc = cps_ch_d/total_chn
gen chn_npd = cps_ch_e/total_chn

egen total_chl = rowtotal(cps_ch_j cps_ch_k cps_ch_l cps_ch_m)

gen chl_plc = cps_ch_j/total_chl
gen chl_bq = cps_ch_k/total_chl
gen chl_pcc = cps_ch_l/total_chl
gen chl_npd = cps_ch_m/total_chl

* Variable explicative : Interet du repondant
rename cps_a5 interet
recode interet (98 99 =.)

* Variable explicative : Identification partisane du repondant
egen id_part = rowfirst(cps_q1a cps_q1b)
recode id_part (0 98 99 = 0) (4 5 6 7 8 9 10 97 = 4)

gen id_plc = 1 if id_part == 1
replace id_plc = 0 if id_part != 1

gen id_pcc = 1 if id_part == 2
replace id_pcc = 0 if id_part != 2

gen id_npd = 1 if id_part == 3
replace id_npd = 0 if id_part != 3

* Variable expliquee : Chances nationales du parti prefere
generate chn_pp = chn_plc if id_part == 1
replace chn_pp = chn_pcc if id_part == 2
replace chn_pp = chn_npd if id_part ==3


* Variable explicative : Sophistication

* Accorder 1 point par bonne reponse (Layton Harper Duceppe Martin)
recode cps_e1 cps_e2 cps_e3 cps_e4 cps_kn_a cps_kn_b cps_kn_c ///
	(1=1) (5 8 9=0)
recode cps_know (10 11 12 13 24 35 46 47 48 59=1) (97 98 99=0) // PM

* Evaluation de l'intervieweur
recode cps_int (1=1) (3=.5) (5=0) (7=.)

* La variable sophistication est une moyenne de bonnes reponses
egen sophistication = rowmean(cps_e1 cps_e2 cps_e3 cps_e4 ///
	cps_know cps_kn_a cps_kn_b cps_kn_c cps_int)

	
	
* Interaction : sophistication et id_part

gen plc_soph = id_plc * sophistication
gen pcc_soph = id_pcc * sophistication
gen npd_soph = id_npd * sophistication	
	
* Variable explicative : Information (Sondages nationaux)
merge m:m date using sondages2004.dta

gen pred_plc = 0
replace pred_plc = 1 if chn_plc > chn_pcc & chn_plc > chn_npd
gen pred_pcc = 0
replace pred_pcc = 1 if chn_pcc > chn_plc & chn_pcc > chn_npd
gen pred_npd = 0
replace pred_npd = 1 if chn_npd > chn_plc & chn_npd > chn_pcc


gen sond_v_plc = 0
replace sond_v_plc = 1 if sond_plc > sond_pcc & sond_plc > sond_npd
gen sond_v_pcc = 0
replace sond_v_pcc = 1 if sond_pcc > sond_plc & sond_pcc > sond_npd
gen sond_v_npd = 0
replace sond_v_npd = 1 if sond_npd > sond_plc & sond_npd > sond_pcc

gen svplc_i = sond_v_plc * interet
gen svpcc_i = sond_v_pcc * interet

gen diff_plc = abs(chn_plc - (sond_plc/100))
gen diff_pcc = abs(chn_pcc - (sond_pcc/100))
gen diff_npd = abs(chn_npd - (sond_npd/100))
gen diff_tot = diff_plc + diff_pcc + diff_npd

	
* Enregistrer les donnees preparees
save "donnees_prep_2004.dta", replace

clear


**********************************
* Preparation des donnees (2006) *
**********************************
clear
use "ces2004-6-8.dta"

* garder seulement les observations cps 06. a faire.

keep ces06_areacode ces06_province ces06_cps_intdate ces06_cps_a3 ///
	ces06_cps_e1 ces06_cps_e2 ces06_cps_e3 ces06_cps_e4 ///
	ces06_cps_know_1 ces06_cps_know_3 ces06_cps_know_3 /// 
	ces06_cps_know_5 ces06_cps_know_6a ///
	ces06_cps_know_6b ces06_cps_polls1 ///
	ces06_cps_int_assess1 ///
	ces06_cps_q1a ces06_cps_q1b ///
	ces06_cps_chance1 ces06_cps_chance2 ces06_cps_chance3 ces06_cps_chance4 ///
	ces06_cps_chance5 ces06_cps_chance6 ces06_cps_chance7 ces06_cps_chance8 ///
	ces06_cps_chance9 ces06_cps_chance10 ces06_cps_chance11 ces06_cps_chance12
	

rename ces06_areacode indicatif
rename ces06_province province
rename ces06_cps_intd date

* Variable expliquee : Predictions de (ch)ances (l)ocales et (n)ationales

recode ces06_cps_chance1 ces06_cps_chance2 ces06_cps_chance3 ///
	ces06_cps_chance7 ces06_cps_chance8 ces06_cps_chance9 ///
	(97 98 99=.) (0 4 5=4)

recode ces06_cps_chance4 ces06_cps_chance5 ces06_cps_chance6 ///
	ces06_cps_chance10 ces06_cps_chance11 ces06_cps_chance12 ///
	(998 999=.)
	
* Petit tour de passe-passe pour assigner les predictions	

generate cps_ch_c = ces06_cps_chance4 if ces06_cps_chance1 ==1
replace cps_ch_c = ces06_cps_chance5 if ces06_cps_chance2 ==1
replace cps_ch_c = ces06_cps_chance6 if ces06_cps_chance3 ==1

generate cps_ch_d = ces06_cps_chance4 if ces06_cps_chance1 ==2
replace cps_ch_d = ces06_cps_chance5 if ces06_cps_chance2 ==2
replace cps_ch_d = ces06_cps_chance6 if ces06_cps_chance3 ==2

generate cps_ch_e = ces06_cps_chance4 if ces06_cps_chance1 ==3
replace cps_ch_e = ces06_cps_chance5 if ces06_cps_chance2 ==3
replace cps_ch_e = ces06_cps_chance6 if ces06_cps_chance3 ==3

generate cps_ch_j = ces06_cps_chance10 if ces06_cps_chance7 ==1
replace cps_ch_j = ces06_cps_chance11 if ces06_cps_chance8 ==1
replace cps_ch_j = ces06_cps_chance12 if ces06_cps_chance9 ==1

generate cps_ch_k = ces06_cps_chance10 if ces06_cps_chance7 ==2
replace cps_ch_k = ces06_cps_chance11 if ces06_cps_chance8 ==2
replace cps_ch_k = ces06_cps_chance12 if ces06_cps_chance9 ==2

generate cps_ch_l = ces06_cps_chance10 if ces06_cps_chance7 ==3
replace cps_ch_l = ces06_cps_chance11 if ces06_cps_chance8 ==3
replace cps_ch_l = ces06_cps_chance12 if ces06_cps_chance9 ==3

generate cps_ch_m = ces06_cps_chance10 if ces06_cps_chance7 ==4
replace cps_ch_m = ces06_cps_chance11 if ces06_cps_chance8 ==4
replace cps_ch_m = ces06_cps_chance12 if ces06_cps_chance9 ==4

recode cps_ch_c cps_ch_d cps_ch_e cps_ch_j cps_ch_k cps_ch_l cps_ch_m ///
	(995=0) (996=100) (997 998 999=.)

* Normalisation : la prediction est calculee selon le total predit pour les trois partis
	
egen total_chn = rowtotal(cps_ch_c cps_ch_d cps_ch_e)
	
gen chn_plc = cps_ch_c/total_chn
gen chn_pcc = cps_ch_d/total_chn
gen chn_npd = cps_ch_e/total_chn

egen total_chl = rowtotal(cps_ch_j cps_ch_k cps_ch_l cps_ch_m)

gen chl_plc = cps_ch_j/total_chl
gen chl_bq = cps_ch_k/total_chl
gen chl_pcc = cps_ch_l/total_chl
gen chl_npd = cps_ch_m/total_chl

* Variable explicative : Interet du repondant
rename ces06_cps_a3 interet
recode interet (98 99 =.)

* Variable explicative : Information
rename ces06_cps_polls1 vusondage
recode vusondage (1=1) (5 8 9=0)

* Variable explicative : Identification partisane du repondant
egen id_part = rowfirst(ces06_cps_q1a ces06_cps_q1b)
recode id_part (0 98 99 = 0) (4 5 6 7 8 9 10 97 = 4)

gen id_plc = 1 if id_part == 1
replace id_plc = 0 if id_part != 1

gen id_pcc = 1 if id_part == 2
replace id_pcc = 0 if id_part != 2

gen id_npd = 1 if id_part == 3
replace id_npd = 0 if id_part != 3

* Variable expliquee : Chances nationales du parti prefere
generate chn_pp = chn_plc if id_part == 1
replace chn_pp = chn_pcc if id_part == 2
replace chn_pp = chn_npd if id_part ==3


* Variable explicative : Sophistication

* Accorder 1 point par bonne reponse
recode ces06_cps_know_1 ///
	(10 11 12 13 24 35 46 47 48 59=1) (97 98 99=0)

recode ces06_cps_know_3 ces06_cps_know_6a ///
	(1=1) (5 8 9=0)

recode ces06_cps_know_5 ces06_cps_e1 ces06_cps_e2 ces06_cps_e3 ces06_cps_e4 ///
	(1=1) (5 7 8 9=0)
	
recode ces06_cps_know_6b ///
	(3=1) (1 2 4 8 9=0)

	

* Evaluation de l'intervieweur
recode ces06_cps_int_assess1 (1=1) (2=0.75) (3=.5) (4=0.25) (5=0) (8=.)

* La variable sophistication est une moyenne de bonnes reponses
egen sophistication = rowmean(ces06_cps_e1 ces06_cps_e2 ces06_cps_e3 ces06_cps_e4 ///
	ces06_cps_know_1 ces06_cps_know_3 ces06_cps_know_3 ces06_cps_know_6a ///
	ces06_cps_know_6b ces06_cps_int_assess1)

tabstat ces06_cps_e1 ces06_cps_e2 ces06_cps_e3 ces06_cps_e4 ///
	ces06_cps_know_1 ces06_cps_know_3 ces06_cps_know_3 ces06_cps_know_6a ///
	ces06_cps_know_6b ces06_cps_int_assess1

	
* Interaction : sophistication et id_part

gen plc_soph = id_plc * sophistication
gen pcc_soph = id_pcc * sophistication
gen npd_soph = id_npd * sophistication		
	
	
merge m:m date using sondages2006.dta

gen sond_v_plc = 0
replace sond_v_plc = 1 if sond_plc > sond_pcc & sond_plc > sond_npd
gen sond_v_pcc = 0
replace sond_v_pcc = 1 if sond_pcc > sond_plc & sond_pcc > sond_npd
gen sond_v_npd = 0
replace sond_v_npd = 1 if sond_npd > sond_plc & sond_npd > sond_pcc

gen svplc_i = sond_v_plc * interet
gen svpcc_i = sond_v_pcc * interet


gen pred_plc = 0
replace pred_plc = 1 if chn_plc > chn_pcc & chn_plc > chn_npd
gen pred_pcc = 0
replace pred_pcc = 1 if chn_pcc > chn_plc & chn_pcc > chn_npd
gen pred_npd = 0
replace pred_npd = 1 if chn_npd > chn_plc & chn_npd > chn_pcc


gen diff_plc = abs(chn_plc - (sond_plc/100))
gen diff_pcc = abs(chn_pcc - (sond_pcc/100))
gen diff_npd = abs(chn_npd - (sond_npd/100))
gen diff_tot = diff_plc + diff_pcc + diff_npd

	

* Enregistrer les donnees preparees
save "donnees_prep_2006.dta", replace
clear


**********************************
* Preparation des donnees (2008) *
**********************************
clear
use "ces2008.dta"

keep ces08_pes_areacode ces08_province ces08_cps_intdate ///
	ces08_cps_a4 ces08_cps_q1a ces08_cps_chance1 ces08_cps_chance2 ///
	ces08_cps_chance3 ces08_cps_e1 ces08_cps_e2 ces08_cps_e3 ces08_cps_e4 ///
	ces08_cps_know_1 ces08_cps_know_2 ces08_cps_know_3 ces08_cps_know_4 ///
	ces08_cps_know_5 

rename ces08_pes_areacode indicatif
rename ces08_cps_intdate date

* Variable expliquee : Predictions de (ch)ances (l)ocales et (n)ationales
rename ces08_cps_chance1 prednat
rename ces08_cps_chance2 predloc
rename ces08_cps_chance3 deuxloc

recode prednat predloc deuxloc (0 4 5=4) (97 98 99=.)

gen pred_plc = 1 if prednat == 1
replace pred_plc = 0 if prednat != 1
gen pred_pcc = 1 if prednat == 2
replace pred_pcc = 0 if prednat != 2
gen pred_npd = 1 if prednat == 3
replace pred_npd = 0 if prednat != 3

* Variable explicative : Interet du repondant
rename ces08_cps_a4 interet
recode interet (98 99 =.)

* Variable explicative : Identification partisane du repondant
rename ces08_cps_q1a id_part
recode id_part (0 98 99 = 0) (4 5 6 7 8 9 10 97 = 4)

gen id_plc = 1 if id_part == 1
replace id_plc = 0 if id_part != 1

gen id_pcc = 1 if id_part == 2
replace id_pcc = 0 if id_part != 2

gen id_npd = 1 if id_part == 3
replace id_npd = 0 if id_part != 3

* Variable explicative : Sophistication

* Accorder 1 point par bonne reponse (Layton Harper Duceppe Martin)
recode ces08_cps_e1 ces08_cps_e2 ces08_cps_e3 ces08_cps_e4 ///
	ces08_cps_know_1 ces08_cps_know_5 (1=1) (5 7 8 9 =0)

recode ces08_cps_know_2 (10 11 12 13 24 35 46 47 48 59=1) (97 98 99 = 0)
recode ces08_cps_know_3 (1 2 3 4 5 6 7 8 9 10 11 12 13 14 ///
15 16 17 18 19 20 21 22 23 24 25 26 27 28=1) (30 97 98 99=0)
recode ces08_cps_know_4 (1 3=1) (5 8 9=0)


	
	
* La variable sophistication est une moyenne de bonnes reponses
egen sophistication = rowmean(ces08_cps_e1 ces08_cps_e2 ces08_cps_e3 ///
	ces08_cps_e4 ces08_cps_know_1 ces08_cps_know_2 ces08_cps_know_3 ///
	ces08_cps_know_4 ces08_cps_know_5)

	
	
* Interaction : sophistication et id_part

gen plc_soph = id_plc * sophistication
gen pcc_soph = id_pcc * sophistication
gen npd_soph = id_npd * sophistication			
	
* Variable explicative : Information (Sondages nationaux)
merge m:m date using sondages2008.dta

replace sond_plc = sond_plc/100
replace sond_pcc = sond_pcc/100
replace sond_npd = sond_npd/100

gen sond_v_plc = 0
replace sond_v_plc = 1 if sond_plc > sond_pcc & sond_plc > sond_npd
gen sond_v_pcc = 0
replace sond_v_pcc = 1 if sond_pcc > sond_plc & sond_pcc > sond_npd
gen sond_v_npd = 0
replace sond_v_npd = 1 if sond_npd > sond_plc & sond_npd > sond_pcc

	
* Enregistrer les donnees preparees
save "donnees_prep_2008.dta", replace

clear


**********************************
* Preparation des donnees (2011) *
**********************************
clear
use "ces2011elus.dta"

keep CPS_INTDATE11  CPS11_9 CPS11_41 CPS11_42 CPS11_43 ///
	CPS11_44 CPS11_45 CPS11_47 CPS11_48 CPS11_68 CPS11_69 ///
	CPS11_70 CPS_int_assess1 CPS11_71 var635 elu partielu ///
	pctelu majelu
	
rename CPS_INTDATE11 date
rename var635 circ

* Variable expliquee : Predictions de (ch)ances (l)ocales et (n)ationales
rename CPS11_44 predloc
rename CPS11_45 deuxloc
rename CPS11_41 meneursondages
rename CPS11_42 pointsmeneur
rename CPS11_48 prediction

recode meneursondages (4 5 = 4) (6 8 9=.)
recode pointsmeneur (97 98 99=.)
recode predloc deuxloc (0 4 5=4) (6 7 98 99=.)
recode prediction (98 99 =.)

gen pred_maj_plc = 1 if prediction == 1
replace pred_maj_plc = 0 if prediction != 1
gen pred_maj_pcc = 1 if prediction == 3
replace pred_maj_pcc = 0 if prediction != 3

gen pred_min_plc = 1 if prediction == 2
replace pred_min_plc = 0 if prediction != 2
gen pred_min_pcc = 1 if prediction == 4
replace pred_min_pcc = 0 if prediction != 4

gen pred_plc = 0
replace pred_plc = 1 if pred_maj_plc == 1
replace pred_plc = 1 if pred_min_plc == 1

gen pred_pcc = 0
replace pred_pcc = 1 if pred_maj_pcc == 1
replace pred_pcc = 1 if pred_min_pcc == 1

gen pred_npd = 1 if prediction == 7
replace pred_npd = 0 if prediction != 7


gen predloc_plc = 1 if predloc == 1
replace predloc_plc = 0 if predloc != 1
gen predloc_pcc = 1 if predloc == 2
replace predloc_pcc = 0 if predloc != 2
gen predloc_npd = 1 if predloc == 3
replace predloc_npd = 0 if predloc != 3
gen predloc_bq = 1 if predloc == 4
replace predloc_bq = 0 if predloc != 4


* Variable explicative : Interet du repondant
rename CPS11_9 interet
recode interet (98 99 =.)




* Variable explicative : Identification partisane du repondant
rename CPS11_71 id_part
recode id_part (6 8 9 = 0) (0 4 5 = 4)

gen id_plc = 1 if id_part == 1
replace id_plc = 0 if id_part != 1

gen id_pcc = 1 if id_part == 2
replace id_pcc = 0 if id_part != 2

gen id_npd = 1 if id_part == 3
replace id_npd = 0 if id_part != 3


* Variable explicative : Sophistication

* Accorder 1 point par bonne reponse (PM prov + min fin + gg)
recode CPS11_68 (5 10 11 12 13 24 35 46 47 48 59=1) (97 98 99=0)
recode CPS11_69 CPS11_70 (1 3=1) (5 8 9=0)

* Evaluation de l'intervieweur
recode CPS_int_assess1 (1=1) (2=.75) (3=.5) (4=.25) (5=0) (7 8=.)

summarize CPS11_68 CPS11_69 CPS11_70 CPS_int_assess1

* La variable sophistication est une moyenne de bonnes reponses
egen sophistication = rowmean(CPS11_68 CPS11_69 CPS11_70 CPS_int_assess1)

merge m:1 circ using resultats2008.dta, keep(1 3)

gen e08_plc = 1 if parti2008 == 1
replace e08_plc = 0 if parti2008 != 1
gen e08_pcc = 1 if parti2008 == 2
replace e08_pcc = 0 if parti2008 != 2
gen e08_npd = 1 if parti2008 == 3
replace e08_npd = 0 if parti2008 != 3
gen e08_bq = 1 if parti2008 == 4
replace e08_bq = 0 if parti2008 != 4


gen e08_plc_i = e08_plc * interet
gen e08_pcc_i = e08_pcc * interet
gen e08_npd_i = e08_npd * interet
gen e08_bq_i = e08_bq * interet


* Interaction : sophistication et id_part

gen plc_soph = id_plc * sophistication
gen pcc_soph = id_pcc * sophistication
gen npd_soph = id_npd * sophistication		

* Variable explicative : Information (Sondages nationaux)
drop _merge
merge m:m date using sondages2011.dta

replace sond_plc = sond_plc/100
replace sond_pcc = sond_pcc/100
replace sond_npd = sond_npd/100


gen sond_v_plc = 0
replace sond_v_plc = 1 if sond_plc > sond_pcc & sond_plc > sond_npd
gen sond_v_pcc = 0
replace sond_v_pcc = 1 if sond_pcc > sond_plc & sond_pcc > sond_npd
gen sond_v_npd = 0
replace sond_v_npd = 1 if sond_npd > sond_plc & sond_npd > sond_pcc


* Enregistrer les donnees preparees
save "donnees_prep_2011.dta", replace

clear





