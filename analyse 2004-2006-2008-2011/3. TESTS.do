


*************************************************************
* H1.1
* PREDp = b + b1 IDp (et autres?)

use "donnees_prep_2004.dta"
logit pred_plc id_plc
logit pred_pcc id_pcc
logit pred_npd id_npd

logit pred_plc id_plc id_pcc id_npd
logit pred_pcc id_plc id_pcc id_npd
logit pred_npd id_plc id_pcc id_npd

regress chn_plc id_plc
regress chn_pcc id_pcc
regress chn_npd id_npd

regress chn_plc id_plc id_pcc id_npd
regress chn_pcc id_plc id_pcc id_npd
regress chn_npd id_plc id_pcc id_npd

clear
use "donnees_prep_2006.dta"
logit pred_plc id_plc
logit pred_pcc id_pcc
logit pred_npd id_npd

logit pred_plc id_plc id_pcc id_npd
logit pred_pcc id_plc id_pcc id_npd
logit pred_npd id_plc id_pcc id_npd

regress chn_plc id_plc
regress chn_pcc id_pcc
regress chn_npd id_npd

regress chn_plc id_plc id_pcc id_npd
regress chn_pcc id_plc id_pcc id_npd
regress chn_npd id_plc id_pcc id_npd


use "donnees_prep_2008.dta"
logit pred_plc id_plc
logit pred_pcc id_pcc
logit pred_npd id_npd

logit pred_plc id_plc id_pcc id_npd
logit pred_pcc id_plc id_pcc id_npd
logit pred_npd id_plc id_pcc id_npd


use "donnees_prep_2011.dta"
logit pred_plc id_plc
logit pred_pcc id_pcc
logit pred_npd id_npd

logit pred_plc id_plc id_pcc id_npd
logit pred_pcc id_plc id_pcc id_npd
logit pred_npd id_plc id_pcc id_npd

*************************************************************




*************************************************************
* H1.2
* PREDp = b0 + b1 IDp b2 soph


clear
use "donnees_prep_2004.dta"


regress chn_plc id_plc sophistication plc_soph
regress chn_pcc id_pcc sophistication pcc_soph
regress chn_npd id_npd sophistication npd_soph

clear
use "donnees_prep_2006.dta"

regress chn_plc id_plc sophistication plc_soph
regress chn_pcc id_pcc sophistication pcc_soph
regress chn_npd id_npd sophistication npd_soph


clear
use "donnees_prep_2008.dta"


regress pred_plc id_plc sophistication plc_soph
regress pred_pcc id_pcc sophistication pcc_soph
regress pred_npd id_npd sophistication npd_soph

clear
use "donnees_prep_2011.dta"

regress pred_plc id_plc sophistication plc_soph
regress pred_pcc id_pcc sophistication pcc_soph
regress pred_npd id_npd sophistication npd_soph



*************************************************************
* H2.1
* PREDp = b0 + b1 SOND

clear
use "donnees_prep_2004.dta"
mixed chn_plc sond_plc || joursavant:
mixed chn_pcc sond_pcc || joursavant:
mixed chn_npd sond_npd || joursavant:


clear
use "donnees_prep_2006.dta"
mixed chn_plc sond_plc || joursavant:
mixed chn_pcc sond_pcc || joursavant:
mixed chn_npd sond_npd || joursavant:

clear
use "donnees_prep_2008.dta"
melogit pred_plc sond_plc || joursavant:
melogit pred_pcc sond_pcc || joursavant:
melogit pred_npd sond_npd || joursavant:

clear
use "donnees_prep_2011.dta"
melogit pred_plc sond_plc || joursavant:
melogit pred_pcc sond_pcc || joursavant:
melogit pred_npd sond_npd || joursavant:




* ICI : CIRC


*************************************************************
* H2.2
* PREDp = b0 + b1 SOND b2 INT

clear
use "donnees_prep_2004.dta"
melogit pred_plc sond_v_plc interet svplc_i || joursavant: 
melogit pred_plc sond_v_plc interet || joursavant: 
melogit pred_pcc sond_v_pcc interet svplc_i || joursavant:
melogit pred_pcc sond_v_pcc interet || joursavant:

mixed chn_plc sond_v_plc interet svplc_i || joursavant:
mixed chn_plc sond_v_plc interet || joursavant:
mixed chn_pcc sond_v_pcc interet svpcc_i || joursavant:
mixed chn_pcc sond_v_pcc interet || joursavant:

mixed chn_plc sond_plc interet || joursavant:
mixed chn_pcc sond_pcc interet || joursavant:

clear
use "donnees_prep_2006.dta"
mixed chn_plc sond_plc interet || joursavant:
mixed chn_pcc sond_pcc interet || joursavant:

clear
use "donnees_prep_2008.dta"
melogit pred_plc sond_plc interet || joursavant:
melogit pred_pcc sond_pcc interet || joursavant:

clear
use "donnees_prep_2011.dta"
melogit pred_plc sond_plc interet || joursavant:
melogit pred_pcc sond_pcc interet || joursavant:

*************************************************************
* 2011 : Information sur le dernier gagnant

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


*************************************************************
* SYNTHESE

clear
use "donnees_prep_2004.dta"

mixed chn_plc






clear
use "donnees_prep_2011.dta"

mixed predloc_plc e08_plc e08_plc_i plc_soph





