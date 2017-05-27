**********************
* Analyses bivariees *
**********************
* clear
* use "donnees_prep_2004.dta"
* use "donnees_prep_2006.dta"
* use "donnees_prep_2008.dta"
* use "donnees_prep_2011.dta"


**************************************************
* Presentations des variables
**************************************************

* Chances de gagner
* 2004 et 2006

clear
use "donnees_prep_2004.dta"
hist chn_plc, percent ///
ytitle(Reponses (%)) xtitle("Chances PLC, 2004 (%)") ///
scheme(s1mono) aspectratio(1) name(chnplc2004, replace) nodraw

histogram chn_pcc,  percent ///
ytitle(Reponses (%)) xtitle("Chances PCC, 2004 (%)") ///
scheme(s1mono) aspectratio(1) name(chnpcc2004, replace) nodraw

histogram chn_npd,  percent ///
ytitle(Reponses (%)) xtitle("Chances NPD, 200, 20044 (%)") ///
scheme(s1mono) aspectratio(1) name(chnnpd2004, replace) nodraw
	
clear
use "donnees_prep_2006.dta"
hist chn_plc,  percent ///
ytitle(Reponses (%)) xtitle("Chances PLC, 2006 (%)") ///
scheme(s1mono) aspectratio(1) name(chnplc2006, replace) nodraw

histogram chn_pcc,  percent ///
ytitle(Reponses (%)) xtitle("Chances PCC, 2006 (%)") ///
scheme(s1mono) aspectratio(1) name(chnpcc2006, replace) nodraw

histogram chn_npd,  percent ///
ytitle(Reponses (%)) xtitle("Chances NPD, 2006 (%)") ///
scheme(s1mono) aspectratio(1) name(chnnpd2006, replace) nodraw
	
graph combine chnplc2004 chnpcc2004 chnnpd2004 chnplc2006 chnpcc2006 chnnpd2006, ///
	row(2) col(3) scheme(s1mono)
	graph export "graphiques/histchn2004-6.png", width(600) height(450) replace
clear

* Chances de gagner
* 2008 et 2011

clear
use "donnees_prep_2008.dta"
graph pie pred_plc pred_pcc pred_npd, ///
	legend(label(1 "PLC") ///
		label(2 "PCC") ///
		label(3 "NPD") ///
		cols(1)) ///
		title("2008") ///
pie(1, color(gs1)) pie(2, color(gs12)) pie(3, color(gs7)) ///
graphregion(fcolor(white)) ///
name(pie_pred_2008, replace) nodraw

clear
use "donnees_prep_2011.dta"
graph pie pred_maj_plc pred_maj_pcc pred_min_plc pred_min_pcc pred_npd, ///
legend(label(1 "PLC majoritaire") ///
		label(2 "PLC minoritaire") ///
		label(3 "PCC majoritaire") ///
		label(4 "PCC minoritaire") ///
		label(5 "NPD")) ///
		title("2011") ///
pie(1, color(gs1)) pie(2, color(gs3)) pie(3, color(gs14)) ///
pie(4, color(gs12)) pie(5, color(gs7)) ///
graphregion(fcolor(white)) ///
name(pie_pred_2011, replace) nodraw

graph combine pie_pred_2008 pie_pred_2011, ///
	row(1) col(2) scheme(s1mono)
	graph export "graphiques/piepred8-11.png", width(600) height(450) replace
clear


* Identification partisane
 
clear
use "donnees_prep_2004.dta"
graph pie, over(id_part) ///
legend(label(1 "Aucune") ///
		label(2 "PLC") ///
		label(3 "PCC") ///
		label(4 "NPD") ///
		label(5 "Autre")) ///
		title("2004") ///
pie(1, color(gs15)) pie(2, color(gs1)) pie(3, color(gs10)) ///
pie(4, color(gs4)) pie(5, color(gs13)) ///
graphregion(fcolor(white)) ///
name(pie_idp2004, replace)  nodraw
 
clear
use "donnees_prep_2006.dta"
graph pie, over(id_part) ///
legend(label(1 "Aucune") ///
		label(2 "PLC") ///
		label(3 "PCC") ///
		label(4 "NPD") ///
		label(5 "Autre")) ///
		title("2006") ///
pie(1, color(gs15)) pie(2, color(gs1)) pie(3, color(gs10)) ///
pie(4, color(gs4)) pie(5, color(gs13)) ///
graphregion(fcolor(white)) ///
name(pie_idp2006, replace)  nodraw
 
clear
use "donnees_prep_2008.dta"
graph pie, over(id_part) ///
legend(label(1 "Aucune") ///
		label(2 "PLC") ///
		label(3 "PCC") ///
		label(4 "NPD") ///
		label(5 "Autre")) ///
		title("2008") ///
pie(1, color(gs15)) pie(2, color(gs1)) pie(3, color(gs10)) ///
pie(4, color(gs4)) pie(5, color(gs13)) ///
graphregion(fcolor(white)) ///
name(pie_idp2008, replace)  nodraw
 
clear
use "donnees_prep_2011.dta"
graph pie, over(id_part) ///
legend(label(1 "Aucune") ///
		label(2 "PLC") ///
		label(3 "PCC") ///
		label(4 "NPD") ///
		label(5 "Autre")) ///
		title("2011") ///
pie(1, color(gs15)) pie(2, color(gs1)) pie(3, color(gs10)) ///
pie(4, color(gs4)) pie(5, color(gs13)) ///
graphregion(fcolor(white)) ///
name(pie_idp2011, replace) nodraw

grc1leg pie_idp2004 pie_idp2006 pie_idp2008 pie_idp2011, ///
	legendfrom(pie_idp2004) ///
	row(2) col(2) graphregion(fcolor(white))
graph export "graphiques/pie_idp.png", width(600) height(450) replace
clear

* Interet
 
clear
use "donnees_prep_2004.dta"
hist interet, percent discrete ///
ytitle(Repondants (%)) xtitle("2004") ///
scheme(s1mono) aspectratio(1) name(i2004, replace) nodraw

clear
use "donnees_prep_2006.dta"
hist interet, percent discrete ///
ytitle(Repondants (%)) xtitle("2006") ///
scheme(s1mono) aspectratio(1) name(i2006, replace) nodraw

clear
use "donnees_prep_2008.dta"
hist interet, percent discrete ///
ytitle(Repondants (%)) xtitle("2008") ///
scheme(s1mono) aspectratio(1) name(i2008, replace) nodraw

clear
use "donnees_prep_2011.dta"
hist interet, percent discrete ///
ytitle(Repondants (%)) xtitle("2011") ///
scheme(s1mono) aspectratio(1) name(i2011, replace) nodraw

graph combine i2004 i2006 i2008 i2011, ///
	ycommon row(2) col(2) scheme(s1mono)
	graph export "graphiques/i2004-6-8-11.png", width(600) height(450) replace
clear

* Sophistication
 
clear
use "donnees_prep_2004.dta"
hist sophistication, percent bin(10) ///
ytitle(Repondants (%)) xtitle("2004") ///
scheme(s1mono) aspectratio(1) name(s2004, replace)

clear
use "donnees_prep_2006.dta"
hist sophistication, percent bin(10) ///
ytitle(Repondants (%)) xtitle("2006") ///
scheme(s1mono) aspectratio(1) name(s2006, replace) nodraw

clear
use "donnees_prep_2008.dta"
hist sophistication, percent bin(10) ///
ytitle(Repondants (%)) xtitle("2008") ///
scheme(s1mono) aspectratio(1) name(s2008, replace) nodraw

clear
use "donnees_prep_2011.dta"
hist sophistication, percent bin(10) ///
ytitle(Repondants (%)) xtitle("2011") ///
scheme(s1mono) aspectratio(1) name(s2011, replace) nodraw

graph combine s2004 s2006 s2008 s2011, ///
	ycommon row(2) col(2) scheme(s1mono)
	graph export "graphiques/s2004-6-8-11.png", width(600) height(450) replace
clear


* Correlation : sophistication - interet

clear
use "donnees_prep_2004.dta"
cor sophistication interet
graph twoway (scatter sophistication interet, msize(tiny) color(gs7) jitter(7)) ///
(lfit sophistication interet, clcolor(black) lwidth(thick)), ///
legend(off) ///
ytitle(Sophistication) xtitle("Interet, 2004 (r = .44)") ///
scheme(s1mono) aspectratio(1) name(si2004, replace) nodraw

clear
use "donnees_prep_2006.dta"
cor sophistication interet
graph twoway (scatter sophistication interet, msize(tiny) color(gs7) jitter(7)) ///
(lfit sophistication interet, clcolor(black) lwidth(thick)), ///
legend(off) ///
ytitle(Sophistication) xtitle("Interet, 2006 (r = .31)") ///
scheme(s1mono) aspectratio(1) name(si2006, replace) nodraw

clear
use "donnees_prep_2008.dta"
cor sophistication interet
graph twoway (scatter sophistication interet, msize(tiny) color(gs7) jitter(7)) ///
(lfit sophistication interet, clcolor(black) lwidth(thick), ///
legend(off) ///
ytitle(Sophistication) xtitle("Interet, 2008 (r = .42)") ///
scheme(s1mono) aspectratio(1) name(si2008, replace) nodraw

clear
use "donnees_prep_2011.dta"
cor sophistication interet
graph twoway (scatter sophistication interet, msize(tiny) color(gs7) jitter(7)) ///
(lfit sophistication interet, clcolor(black) lwidth(thick), ///
legend(off) ///
ytitle(Sophistication) xtitle("Interet, 2011 (r = .23)") ///
scheme(s1mono) aspectratio(1) name(si2011, replace) nodraw

graph combine si2004 si2006 si2008 si2011, ///
	ycommon row(2) col(2) scheme(s1mono)
	graph export "graphiques/si2004-6-8-11.png", width(600) height(450) replace
clear

* Sondages

clear
use "sondages2004.dta"
twoway (lowess sond_plc joursavant, sort lpattern(solid)) ///
	(lowess sond_pcc joursavant, sort lpattern(dash)) ///
	(lowess sond_npd joursavant, sort lpattern(longdash)), ///
	title("2004") ///
	legend(label(1 "PLC") ///
		label(2 "PCC") ///
		label(3 "NPD")) ///
	ytitle("Intentions de vote") ///
	xtitle("Jours avant le scrutin") ///
	scheme(s1mono) legend(off) aspectratio(1) name(sond2004, replace) nodraw

clear
use "sondages2006.dta"
twoway (lowess sond_plc joursavant, sort lpattern(solid)) ///
	(lowess sond_pcc joursavant, sort lpattern(dash)) ///
	(lowess sond_npd joursavant, sort lpattern(longdash)), ///
	title("2006") ///
	ytitle("Intentions de vote") ///
	xtitle("Jours avant le scrutin") ///
	scheme(s1mono) legend(off) aspectratio(1) name(sond2006, replace) nodraw

clear
use "sondages2008.dta"
twoway (lowess sond_plc joursavant, sort lpattern(solid)) ///
	(lowess sond_pcc joursavant, sort lpattern(dash)) ///
	(lowess sond_npd joursavant, sort lpattern(longdash)), ///
	title("2008") ///
	ytitle("Intentions de vote") ///
	xtitle("Jours avant le scrutin") ///
	scheme(s1mono) legend(off) aspectratio(1) name(sond2008, replace) nodraw

clear
use "sondages2011.dta"
twoway (lowess sond_plc joursavant, sort lpattern(solid)) ///
	(lowess sond_pcc joursavant, sort lpattern(dash)) ///
	(lowess sond_npd joursavant, sort lpattern(longdash)), ///
	title("2011") ///
	ytitle("Intentions de vote") ///
	xtitle("Jours avant le scrutin") ///
	scheme(s1mono) legend(off) aspectratio(1) name(sond2011, replace) nodraw

grc1leg sond2004 sond2006 sond2008 sond2011, legendfrom(sond2004) ///
	ycommon row(2) col(2) scheme(s1mono)
	graph export "graphiques/sond2004-6-8-11.png", width(600) height(450) replace
clear

**************************************************	
* H1.1 Identification -> prediction
**************************************************

* 2004 et 2006

clear
use "donnees_prep_2004.dta"
graph box chn_plc chn_pcc chn_npd, over(id_part, gap(300) ///
	label(ticks) ///
	relabel(1 "aucun" 2 "plc" 3 "pcc" 4 "npd" 5 "autre")) ///
	box(1, fcolor(gs1)) box(2, fcolor(gs15)) box(3, fcolor(gs3)) ///
	title("2004") ///
	b1title("Identification partisane") ///
	ytitle("Chances du parti") ///
	scheme(s1mono) ///
	legend(label(1 "PLC") ///
		label(2 "PCC") ///
		label(3 "NPD")) ///
	name(h11e4, replace) nodraw

clear
use "donnees_prep_2006.dta"
graph box chn_plc chn_pcc chn_npd, over(id_part, gap(300) ///
	label(ticks) ///
	relabel(1 "aucun" 2 "plc" 3 "pcc" 4 "npd" 5 "autre")) ///
	box(1, fcolor(gs1)) box(2, fcolor(gs15)) box(3, fcolor(gs3)) ///
	title("2006") ///
	scheme(s1mono) ///
	b1title("Identification partisane") ///
	ytitle("Chances du parti") ///
	name(h11e6, replace) nodraw


grc1leg h11e4 h11e6, ycommon scheme(s1mono)
graph export "graphiques/h11e4-6.png", width(600) height(450) replace
clear

* 2008 et 2011

clear
use "donnees_prep_2008.dta"
graph bar (mean) pred_plc pred_pcc pred_npd, over(id_part, ///
	relabel(1 "aucun" 2 "plc" 3 "pcc" 4 "npd" 5 "autre")) ///
	box(1, fcolor(gs1)) box(2, fcolor(gs15)) box(3, fcolor(gs7)) ///
	title("2008") ///
	b1title("Identification partisane") ///
	ytitle("Chances du parti") ///
	scheme(s1mono) ///
	legend(label(1 "PLC") ///
		label(2 "PCC") ///
		label(3 "NPD") ///
		cols(1)) ///
	name(h11e8, replace) nodraw


clear
use "donnees_prep_2011.dta"
graph bar (mean) pred_maj_plc pred_min_plc pred_maj_pcc pred_min_pcc pred_npd, over(id_part, ///
	relabel(1 "aucun" 2 "plc" 3 "pcc" 4 "npd" 5 "autre")) ///
	box(1, fcolor(gs1)) box(2, fcolor(gs3)) box(3, fcolor(gs15)) box(4, fcolor(gs12)) box(5, fcolor(gs7)) ///
	title("2011") ///
	b1title("Identification partisane") ///
	ytitle("Chances du parti") ///
	scheme(s1mono) ///
	legend(label(1 "PLC maj.") ///
		label(2 "PLC min.") ///
		label(3 "PCC maj.") ///
		label(4 "PCC min.") ///
		label(5 "NPD")) ///
	name(h11e11, replace) nodraw
clear

graph combine h11e8 h11e11, scheme(s1mono)
graph export "graphiques/h11e8-11.png", replace
clear

	
****************************************************
* H1.2 Identification * sophistication -> prediction 
****************************************************

* 2004 et 2006

clear
use "donnees_prep_2004.dta"

graph twoway (scatter chn_plc sophistication if id_part == 1, msize(vtiny) color(gs2) ///
	jitter(3)) ///
	(scatter chn_plc sophistication if id_part != 1, msize(vtiny) color(gs9) jitter(3)) ///
	(lowess chn_plc sophistication if id_part == 1, lwidth(thick) clcolor(black)) ///
	(lowess chn_plc sophistication if id_part != 1, lwidth(thin)), ///
	aspectratio(1) ///
	ytitle("Chances du PLC, 2004") ///
	xtitle("Sophistication") ///
	legend(off) scheme(s1mono) ///
	name(h12plc4, replace) nodraw
		
graph twoway (scatter chn_pcc sophistication if id_part == 2, msize(vtiny) color(gs2) ///
	jitter(3)) ///
	(scatter chn_pcc sophistication if id_part != 2, msize(vtiny) color(gs9) jitter(3)) ///
	(lowess chn_pcc sophistication if id_part == 2, lwidth(thick) clcolor(black)) ///
	(lowess chn_pcc sophistication if id_part != 2, lwidth(thin)), ///
	aspectratio(1) ///
	ytitle("Chances du PCC, 2004") ///
	xtitle("Sophistication") ///
	legend(off) scheme(s1mono) ///
	name(h12pcc4, replace) nodraw
	
graph twoway (scatter chn_npd sophistication if id_part == 3, msize(vtiny) color(gs2) ///
	jitter(3)) ///
	(scatter chn_npd sophistication if id_part != 3, msize(vtiny) color(gs9) jitter(3)) ///
	(lowess chn_npd sophistication if id_part == 3, lwidth(thick) clcolor(black)) ///
	(lowess chn_npd sophistication if id_part != 3, lwidth(thin)), ///
	aspectratio(1) ///
	ytitle("Chances du NPD, 2004") ///
	xtitle("Sophistication") ///
	legend(off) scheme(s1mono) ///
	name(h12npd4, replace) nodraw

clear
use "donnees_prep_2006.dta"

graph twoway (scatter chn_plc sophistication if id_part == 1, msize(vtiny) color(gs2) ///
	jitter(3)) ///
	(scatter chn_plc sophistication if id_part != 1, msize(vtiny) color(gs9) jitter(3)) ///
	(lowess chn_plc sophistication if id_part == 1, lwidth(thick) clcolor(black)) ///
	(lowess chn_plc sophistication if id_part != 1, lwidth(thin)), ///
	aspectratio(1) ///
	ytitle("Chances du PLC, 2006") ///
	xtitle("Sophistication") ///
	legend(off) scheme(s1mono) ///
	name(h12plc6, replace) nodraw
	
graph twoway (scatter chn_pcc sophistication if id_part == 2, msize(vtiny) color(gs2) ///
	jitter(3)) ///
	(scatter chn_pcc sophistication if id_part != 2, msize(vtiny) color(gs9) jitter(3)) ///
	(lowess chn_pcc sophistication if id_part == 2, lwidth(thick) clcolor(black)) ///
	(lowess chn_pcc sophistication if id_part != 2, lwidth(thin)), ///
	aspectratio(1) ///
	ytitle("Chances du PCC, 2006") ///
	xtitle("Sophistication") ///
	legend(off) scheme(s1mono) ///
	name(h12pcc6, replace) nodraw
	
graph twoway (scatter chn_npd sophistication if id_part == 3, msize(vtiny) color(gs2) ///
	jitter(3)) ///
	(scatter chn_npd sophistication if id_part != 3, msize(vtiny) color(gs9) jitter(3)) ///
	(lowess chn_npd sophistication if id_part == 3, lwidth(thick) clcolor(black)) ///
	(lowess chn_npd sophistication if id_part != 3, lwidth(thin)), ///
	aspectratio(1) ///
	ytitle("Chances du NPD, 2006") ///
	xtitle("Sophistication") ///
	legend(off) scheme(s1mono) ///
	name(h12npd6, replace) nodraw
	
graph combine h12plc4 h12pcc4 h12npd4 h12plc6 h12pcc6 h12npd6, ///
	xcommon ycommon row(2) col(3) scheme(s1mono)
	graph export "graphiques/h12e4-6.png", width(600) height(450) replace
clear

* 2008 et 2011

clear
use "donnees_prep_2008.dta"

graph twoway (scatter pred_plc sophistication if id_part == 1, msize(vtiny) color(gs2) ///
	jitter(3)) ///
	(scatter pred_plc sophistication if id_part != 1, msize(vtiny) color(gs9) jitter(3)) ///
	(lowess pred_plc sophistication if id_part == 1, clcolor(black) lwidth(thick)) ///
	(lowess pred_plc sophistication if id_part != 1, lwidth(thin)), ///
	aspectratio(1) ///
	ytitle("Victoire du PLC, 2008") ///
	xtitle("Sophistication") ///
	legend(off) scheme(s1mono) ///
	name(h12plc8, replace) nodraw
		
graph twoway (scatter pred_pcc sophistication if id_part == 2, msize(vtiny) color(gs2) ///
	jitter(3)) ///
	(scatter pred_pcc sophistication if id_part != 2, msize(vtiny) color(gs9) jitter(3)) ///
	(lowess pred_pcc sophistication if id_part == 2, clcolor(black) lwidth(thick)) ///
	(lowess pred_pcc sophistication if id_part != 2, lwidth(thin)), ///
	aspectratio(1) ///
	ytitle("Victoire du PCC, 2008") ///
	xtitle("Sophistication") ///
	legend(off) scheme(s1mono) ///
	name(h12pcc8, replace) nodraw
	
graph twoway (scatter pred_npd sophistication if id_part == 3, msize(vtiny) color(gs2) ///
	jitter(3)) ///
	(scatter pred_npd sophistication if id_part != 3, msize(vtiny) color(gs9) jitter(3)) ///
	(lowess pred_npd sophistication if id_part == 3, clcolor(black) lwidth(thick)) ///
	(lowess pred_npd sophistication if id_part != 3, lwidth(thin)), ///
	aspectratio(1) ///
	ytitle("Victoire du NPD, 2008") ///
	xtitle("Sophistication") ///
	legend(off) scheme(s1mono) ///
	name(h12npd8, replace) nodraw

clear
use "donnees_prep_2011.dta"

graph twoway (scatter pred_plc sophistication if id_part == 1, msize(vtiny) color(gs2) ///
	jitter(3)) ///
	(scatter pred_plc sophistication if id_part != 1, msize(vtiny) color(gs9) jitter(3)) ///
	(lowess pred_plc sophistication if id_part == 1, clcolor(black) lwidth(thick)) ///
	(lowess pred_plc sophistication if id_part != 1, lwidth(thin)), ///
	aspectratio(1) ///
	ytitle("Victoire du PLC, 2011") ///
	xtitle("Sophistication") ///
	legend(off) scheme(s1mono) ///
	name(h12plc11, replace) nodraw
	
graph twoway (scatter pred_pcc sophistication if id_part == 2, msize(vtiny) color(gs2) ///
	jitter(3)) ///
	(scatter pred_pcc sophistication if id_part != 2, msize(vtiny) color(gs9) jitter(3)) ///
	(lowess pred_pcc sophistication if id_part == 2, clcolor(black) lwidth(thick)) ///
	(lowess pred_pcc sophistication if id_part != 2, lwidth(thin)), ///
	aspectratio(1) ///
	ytitle("Victoire du PCC, 2011") ///
	xtitle("Sophistication") ///
	legend(off) scheme(s1mono) ///
	name(h12pcc11, replace) nodraw
	
graph twoway (scatter pred_npd sophistication if id_part == 3, msize(vtiny) color(gs2) ///
	jitter(3)) ///
	(scatter pred_npd sophistication if id_part != 3, msize(vtiny) color(gs9) jitter(3)) ///
	(lowess pred_npd sophistication if id_part == 3, clcolor(black) lwidth(thick)) ///
	(lowess pred_npd sophistication if id_part != 3, lwidth(thin)), ///
	aspectratio(1) ///
	ytitle("Victoire du NPD, 2011") ///
	xtitle("Sophistication") ///
	legend(off) scheme(s1mono) ///
	name(h12npd11, replace) nodraw
	
graph combine h12plc8 h12pcc8 h12npd8 h12plc11 h12pcc11 h12npd11, ///
	xcommon ycommon row(2) col(3) scheme(s1mono)
	graph export "graphiques/h12e8-11.png", width(600) height(450) replace
clear


*******************************************
* H2.1 Information -> prediction (2004 et 2006)
* H2.2 Information X Interet -> prediction (2004 et 2006)
*******************************************




clear
use "donnees_prep_2004.dta"

	
graph twoway (scatter chn_plc sond_plc) ///
			(lfit chn_plc sond_plc), aspectratio(1)

graph twoway (scatter chn_pcc sond_pcc) ///
			(lfit chn_pcc sond_pcc), aspectratio(1)

graph twoway (scatter chn_npd sond_npd) ///
			(lfit chn_npd sond_npd), aspectratio(1)


graph twoway (scatter pred_plc sond_plc) ///
			(lfit pred_plc sond_plc), aspectratio(1)

graph twoway (scatter pred_pcc sond_pcc) ///
			(lfit pred_pcc sond_pcc), aspectratio(1)

graph twoway (scatter pred_npd sond_npd) ///
			(lfit pred_npd sond_npd), aspectratio(1)




* Ici, on calcule la difference entre le dernier sondage et la prediction.
* L'idee etant que plus quelqu'un est interesse, plus il s'aligne sur l'info. 


graph twoway (lowess diff_plc joursavant, sort clcolor(red)) ///
			(lowess diff_pcc joursavant, sort clcolor(blue)) ///
			(lowess diff_npd joursavant, sort clcolor(orange)) ///
			(lowess diff_tot joursavant, sort clcolor(black))




	

clear
use "donnees_prep_2004.dta"

replace sond_plc = sond_plc/100
replace sond_pcc = sond_pcc/100
replace sond_npd = sond_npd/100


graph twoway (lowess sond_plc joursavant, sort clcolor(black)) ///
	(lowess chn_plc joursavant, sort clcolor(black) lpattern(dash)), ///
	ytitle("PLC, 2004") ///
	xtitle("Jours avant le scrutin") ///
	legend(label(1 "Intention de votes selon le dernier sondage") ///
	label(2 "Predictions des repondants") ///
	cols(1)) ///
	legend(on) ///
	name(h21plc4, replace) nodraw scheme(s1mono)
	
	
graph twoway (lowess sond_pcc joursavant, sort clcolor(black)) ///
	(lowess chn_pcc joursavant, sort clcolor(black) lpattern(dash)), ///
	ytitle("PCC, 2004") ///
	xtitle("Jours avant le scrutin") ///
	legend(on)  ///
	name(h21pcc4, replace) nodraw


graph twoway (lowess sond_npd joursavant, sort clcolor(black)) ///
	(lowess chn_npd joursavant, sort clcolor(black) lpattern(dash)), ///
	ytitle("NPD, 2004") ///
	xtitle("Jours avant le scrutin") ///
	legend(on) ///
	name(h21npd4, replace) nodraw	
	
clear
use "donnees_prep_2006.dta"

replace sond_plc = sond_plc/100
replace sond_pcc = sond_pcc/100
replace sond_npd = sond_npd/100


graph twoway (lowess sond_plc joursavant, sort clcolor(black)) ///
	(lowess chn_plc joursavant, sort clcolor(black) lpattern(dash)), ///
	ytitle("PLC, 2006") ///
	xtitle("Jours avant le scrutin") ///
	legend(on) ///
	name(h21plc6, replace) nodraw
	
	
graph twoway (lowess sond_pcc joursavant, sort clcolor(black)) ///
	(lowess chn_pcc joursavant, sort clcolor(black) lpattern(dash)), ///
	ytitle("PCC, 2006") ///
	xtitle("Jours avant le scrutin") ///
	legend(on) ///
	name(h21pcc6, replace) nodraw


graph twoway (lowess sond_npd joursavant, sort clcolor(black)) ///
	(lowess chn_npd joursavant, sort clcolor(black) lpattern(dash)), ///
	ytitle("NPD, 2006") ///
	xtitle("Jours avant le scrutin") ///
	legend(on) ///
	name(h21npd6, replace) nodraw	
	
	
grc1leg h21plc4 h21pcc4 h21npd4 h21plc6 h21pcc6 h21npd6, ///
	row(2) col(3) scheme(s1mono) legendfrom(h21plc4) commonscheme
	graph export "graphiques/h21e4-6.png", width(600) height(450) replace
clear



clear
use "donnees_prep_2008.dta"


graph twoway (lowess sond_plc joursavant, sort clcolor(black)) ///
	(lowess pred_plc joursavant, sort clcolor(black) lpattern(dash)), ///
	ytitle("PLC, 2008") ///
	xtitle("Jours avant le scrutin") ///
	scheme(s1mono) ///
	legend(label(1 "Intention de votes selon le dernier sondage") ///
	label(2 "Predictions des repondants") ///
	cols(1)) ///
	name(h21plc8, replace) nodraw
	
	
graph twoway (lowess sond_pcc joursavant, sort clcolor(black)) ///
	(lowess pred_pcc joursavant, sort clcolor(black) lpattern(dash)), ///
	ytitle("PCC, 2008") ///
	xtitle("Jours avant le scrutin") ///
	legend(on)  ///
	name(h21pcc8, replace) nodraw


graph twoway (lowess sond_npd joursavant, sort clcolor(black)) ///
	(lowess pred_npd joursavant, sort clcolor(black) lpattern(dash)), ///
	ytitle("NPD, 2008") ///
	xtitle("Jours avant le scrutin") ///
	legend(on) ///
	name(h21npd8, replace) nodraw
	

clear
use "donnees_prep_2011.dta"




graph twoway (lowess sond_plc joursavant, sort clcolor(black)) ///
	(lowess pred_plc joursavant, sort clcolor(black) lpattern(dash)), ///
	ytitle("PLC, 2011") ///
	xtitle("Jours avant le scrutin") ///
	legend(on) ///
	name(h21plc11, replace) nodraw
	
	
graph twoway (lowess sond_pcc joursavant, sort clcolor(black)) ///
	(lowess pred_pcc joursavant, sort clcolor(black) lpattern(dash)), ///
	ytitle("PCC, 2011") ///
	xtitle("Jours avant le scrutin") ///
	legend(on) ///
	name(h21pcc11, replace) nodraw


graph twoway (lowess sond_npd joursavant, sort clcolor(black)) ///
	(lowess pred_npd joursavant, sort clcolor(black) lpattern(dash)), ///
	ytitle("NPD, 2011") ///
	xtitle("Jours avant le scrutin") ///
	legend(on) ///
	name(h21npd11, replace) nodraw	
	
	
grc1leg h21plc8 h21pcc8 h21npd8 h21plc11 h21pcc11 h21npd11, ///
	row(2) col(3) scheme(s1mono) commonscheme legendfrom(h21plc8)
	graph export "graphiques/h21e8-11.png", width(600) height(450) replace
clear


clear
use "donnees_prep_2004.dta"



graph twoway (lowess diff_plc interet, clcolor(black) lpattern(solid)) ///
	(lowess diff_pcc interet, clcolor(black) lpattern(dash)) ///
	(lowess diff_npd interet, clcolor(black) lpattern(longdash)), ///
	aspectratio(1) ///
	scheme(s1mono) ///
	title("2004") ///
	ytitle("Difference") ///
	xtitle("Interet pour la campagne") ///
	legend(label(1 "PLC") ///
	label(2 "PCC") ///
	label(3 "NPD") ///
	cols(1)) ///
	name(h22e4, replace) nodraw


clear
use "donnees_prep_2006.dta"

graph twoway (lowess diff_plc interet, clcolor(black) lpattern(solid)) ///
	(lowess diff_pcc interet, clcolor(black) lpattern(dash)) ///
	(lowess diff_npd interet, clcolor(black) lpattern(longdash)), ///
	aspectratio(1) ///
	title("2006") ///
	ytitle("Difference") ///
	xtitle("Interet pour la campagne") ///
	legend(on) ///
	name(h22e6, replace) nodraw



grc1leg h22e4 h22e6, ///
	row(1) col(2) legendfrom(h22e4) scheme(s1mono) commonscheme
	graph export "graphiques/h22e4-6.png", width(600) height(450) replace
clear






clear
use "donnees_prep_2004.dta"
twoway (lowess pred_plc interet if sond_v_plc == 1, clcolor(black) lwidth(thick)) ///
	(lowess pred_plc interet if sond_v_plc == 0, clcolor(black)), ///
		aspectratio(1) ///
	ytitle("Victoire PLC, 2004") ///
	xtitle("Interet") ///
	legend(off) scheme(s1mono) ///
	name(h22plc4, replace) nodraw

	
	
twoway (lowess pred_pcc interet if sond_v_pcc == 1, clcolor(black) lwidth(thick)) ///
	(lowess pred_pcc interet if sond_v_pcc == 0, clcolor(black)), ///
		aspectratio(1) ///
	ytitle("Victoire PCC, 2004") ///
	xtitle("Interet") ///
	legend(off) scheme(s1mono) ///
	name(h22pcc4, replace) nodraw

	
clear
use "donnees_prep_2006.dta"
twoway (lowess pred_plc interet if sond_v_plc == 1, clcolor(black) lwidth(thick)) ///
	(lowess pred_plc interet if sond_v_plc == 0, clcolor(black)), ///
		aspectratio(1) ///
	ytitle("Victoire PLC, 2006") ///
	xtitle("Interet") ///
	legend(off) scheme(s1mono) ///
	name(h22plc6, replace) nodraw

twoway (lowess pred_pcc interet if sond_v_pcc == 1, clcolor(black) lwidth(thick)) ///
	(lowess pred_pcc interet if sond_v_pcc == 0, clcolor(black)), ///
		aspectratio(1) ///
	ytitle("Victoire PCC, 2006") ///
	xtitle("Interet") ///
	legend(off) scheme(s1mono) ///
	name(h22pcc6, replace) nodraw

	
clear
use "donnees_prep_2008.dta"
twoway (lowess pred_plc interet if sond_v_plc == 1, clcolor(black) lwidth(thick)) ///
	(lowess pred_plc interet if sond_v_plc == 0, clcolor(black)), ///
		aspectratio(1) ///
	ytitle("Victoire PLC, 2008") ///
	xtitle("Interet") ///
	legend(off) scheme(s1mono) ///
	name(h22plc8, replace) nodraw

twoway (lowess pred_pcc interet if sond_v_pcc == 1, clcolor(black) lwidth(thick)) ///
	(lowess pred_pcc interet if sond_v_pcc == 0, clcolor(black)), ///
		aspectratio(1) ///
	ytitle("Victoire PCC, 2008") ///
	xtitle("Interet") ///
	legend(off) scheme(s1mono) ///
	name(h22pcc8, replace) nodraw
	
clear
use "donnees_prep_2011.dta"
twoway (lowess pred_npd interet if sond_v_npd == 1, clcolor(black) lwidth(thick)) ///
	(lowess pred_npd interet if sond_v_npd == 0, clcolor(black)), ///
		aspectratio(1) ///
	ytitle("Victoire NPD, 2011") ///
	xtitle("Interet") ///
	legend(off) scheme(s1mono) ///
	name(h22npd11, replace) nodraw

twoway (lowess pred_pcc interet if sond_v_pcc == 1, clcolor(black) lwidth(thick)) ///
	(lowess pred_pcc interet if sond_v_pcc == 0, clcolor(black)), ///
		aspectratio(1) ///
	ytitle("Victoire PCC, 2011") ///
	xtitle("Interet") ///
	legend(off) scheme(s1mono) ///
	name(h22pcc11, replace) nodraw

graph combine h22plc4 h22pcc4 h22plc6 h22pcc6 h22plc8 h22pcc8 h22pcc11 h22npd11, ///
	xcommon ycommon row(2) col(4) scheme(s1mono)
	graph export "graphiques/h22e4-6-8-11.png", width(600) height(450) replace
clear


*********** H2 : 2011 circ ***********
clear
use "donnees_prep_2011.dta"

melogit predloc_plc e08_plc || circ:
melogit predloc_pcc e08_pcc || circ:
melogit predloc_npd e08_npd || circ:
melogit predloc_bq e08_bq || circ:

melogit predloc_plc e08_plc e08_plc_i || circ:
melogit predloc_pcc e08_pcc e08_pcc_i || circ:
melogit predloc_npd e08_npd e08_npd_i || circ:
melogit predloc_bq e08_bq e08_bq_i || circ:

clear
use "donnees_prep_2011.dta"

twoway (lfit predloc_plc interet if e08_plc == 1, clcolor(black) lwidth(thick)) ///
	(lfit predloc_plc interet if e08_plc == 0, clcolor(black)), ///
		aspectratio(1) ///
	ytitle("Victoire PLC, 2011") ///
	xtitle("Interet") ///
	legend(off) scheme(s1mono) ///
	name(h22plc11, replace) nodraw

twoway (lfit predloc_pcc interet if e08_plc == 1, clcolor(black) lwidth(thick)) ///
	(lfit predloc_pcc interet if e08_pcc == 0, clcolor(black)), ///
		aspectratio(1) ///
	ytitle("Victoire PCC, 2011") ///
	xtitle("Interet") ///
	legend(off) scheme(s1mono) ///
	name(h22pcc11, replace) nodraw
	
twoway (lfit predloc_npd interet if e08_npd == 1, clcolor(black) lwidth(thick)) ///
	(lfit predloc_npd interet if e08_npd == 0, clcolor(black)), ///
		aspectratio(1) ///
	ytitle("Victoire NPD, 2011") ///
	xtitle("Interet") ///
	legend(off) scheme(s1mono) ///
	name(h22npd11, replace) nodraw
	
twoway (lfit predloc_bq interet if e08_bq == 1, clcolor(black) lwidth(thick)) ///
	(lfit predloc_bq interet if e08_bq == 0, clcolor(black)), ///
		aspectratio(1) ///
	ytitle("Victoire BQ, 2011") ///
	xtitle("Interet") ///
	legend(off) scheme(s1mono) ///
	name(h22bq11, replace) nodraw
	
graph combine h22plc11 h22pcc11 h22npd11 h22bq11, ///
	xcommon ycommon row(2) col(2) scheme(s1mono)
	graph export "graphiques/h22e11.png", width(600) height(450) replace
clear
	
	

************************
	clear
use "donnees_prep_2011.dta"

	
twoway (lfit predloc_plc interet if e08_plc == 1, clcolor(red)) ///
	(lfit predloc_plc interet if e08_pcc == 1, clcolor(black)), ///
		aspectratio(1) ///
	ytitle("Victoire PLC, 2011") ///
	xtitle("Interet") ///
	legend(off) scheme(s1mono) ///
	name(h22plc11, replace) nodraw

twoway (lfit predloc_pcc interet if e08_pcc == 1, clcolor(blue)) ///
	(lfit predloc_pcc interet if e08_plc == 1, clcolor(black)), ///
		aspectratio(1) ///
	ytitle("Victoire PCC, 2011") ///
	xtitle("Interet") ///
	legend(off) scheme(s1mono) ///
	name(h22pcc11, replace) nodraw
	
twoway (lfit predloc_npd interet if e08_npd == 1, clcolor(orange)) ///
	(lfit predloc_npd interet if e08_npd == 0, clcolor(black)), ///
		aspectratio(1) ///
	ytitle("Victoire NPD, 2011") ///
	xtitle("Interet") ///
	legend(off) scheme(s1mono) ///
	name(h22npd11, replace) nodraw
	
twoway (lfit predloc_bq interet if e08_bq == 1, clcolor(blue)) ///
	(lfit predloc_bq interet if e08_bq == 0, clcolor(black)), ///
		aspectratio(1) ///
	ytitle("Victoire BQ, 2011") ///
	xtitle("Interet") ///
	legend(off) scheme(s1mono) ///
	name(h22bq11, replace) nodraw
	
graph combine h22plc11 h22pcc11 h22npd11 h22bq11, ///
	xcommon ycommon row(2) col(2) scheme(s1mono)
	graph export "graphiques/h22e11b.png", width(600) height(450) replace
clear
	
	
