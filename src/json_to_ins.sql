drop table emer_data;

CREATE TABLE EMER_DATA(year INTEGER, oshpd_id INTEGER, county VARCHAR, facility VARCHAR, medi_cal VARCHAR, medicare VARCHAR, private_coverage VARCHAR, uninsured VARCHAR, other_payer VARCHAR, self_pay VARCHAR);

INSERT INTO EMER_DATA (
select 2005, oshpd_id9, COUNTY, FAC_NAME, Medi_Cal,    Medicare, Private_Coverage+Other_Payer, Uninsured, '', '' from 'data/2005-hospital-emergency-department-characteristics-by-facility-pivot-profile.xlsx.json' UNION
select 2006, oshpd_id9, COUNTY, FAC_NAME, Medi_Cal,    Medicare, Private_Coverage+Other_Payer, Uninsured, '', '' from 'data/2006-hospital-emergency-department-characteristics-by-facility-pivot-profile.xlsx.json' UNION
select 2007, oshpd_id9, COUNTY, FAC_NAME, Medi_Cal,    Medicare, Private_Coverage+Other_Payer, Uninsured, '', '' from 'data/2007-hospital-emergency-department-characteristics-by-facility-pivot-profile.xlsx.json' UNION
select 2008, oshpd_id9, COUNTY, FAC_NAME, Medi_Cal,    Medicare, Private_Coverage+Other_Payer, Uninsured, '', '' from 'data/2008-hospital-emergency-department-characteristics-by-facility-pivot-profile.xlsx.json' UNION
select 2009, oshpd_id9, COUNTY, FAC_NAME, Medi_Cal,    Medicare, Private_Coverage+Other_Payer, Uninsured, '', '' from 'data/2009-hospital-emergency-department-characteristics-by-facility-pivot-profile.xlsx.json' UNION
select 2010, oshpd_id9, COUNTY, FAC_NAME,    Medi_Cal, Medicare, Private_Coverage+other_payer, Uninsured, '', '' from 'data/2010-hospital-emergency-department-characteristics-by-facility-pivot-profile.xlsx.json' UNION
select 2011, oshpd_id9, COUNTY, FAC_NAME, Medi_Cal,    Medicare, Private_Coverage+Other_Payer, Uninsured, '', '' from 'data/2011-hospital-emergency-department-characteristics-by-facility-pivot-profile.xlsx.json' UNION
select 2012, oshpd_id2, COUNTY_NAME, FACILITY_NAME, Medi_Cal,    Medicare, Private_Coverage+Other_Payer, Uninsured, '', ''  from 'data/2012-hospital-emergency-department-characteristics-by-facility-pivot-profile.xlsx.json' UNION
select 2013, oshpd_id2, COUNTY_NAME, FACILITY_NAME, Medi_Cal,    Medicare, Private_Coverage+Other_Payer, Uninsured, '', ''  from 'data/2013-hospital-emergency-department-characteristics-by-facility-pivot-profile.xlsx.json' UNION
select 2014, oshpd_id2, COUNTY_NAME, FACILITY_NAME, Medi_Cal,    Medicare, Private_Coverage+Other_Payer, Unknown_Payer+SelfPay,'','' from 'data/2014-hospital-emergency-department-characteristics-by-facility-pivot-profile.xlsx.json' UNION
select 2015, oshpd_id2, COUNTY_NAME, FACILITY_NAME, Medi_Cal,    Medicare, Private_Coverage+Other_Payer, Unknown_Payer+SelfPay,'','' from 'data/2015-hospital-emergency-department-characteristics-by-facility-pivot-profile.xlsx.json' UNION
select 2016, oshpd_id2, COUNTY_NAME, FACILITY_NAME, Medi_Cal,    Medicare, Private_Coverage+Other_Payer, Unknown_Payer+SelfPay,'','' from 'data/2016-hospital-emergency-department-characteristics-by-facility-pivot-profile.xlsx.json' UNION
select 2017, oshpd_id2, COUNTY_NAME, FACILITY_NAME, Medi_Cal,    Medicare, Private_Coverage+Other_Payer, Unknown_Payer+SelfPay,'','' from 'data/2017-hospital-emergency-department-characteristics-by-facility-pivot-profile.xlsx.json' UNION
select 2018, oshpd_id2, COUNTY_NAME, FACILITY_NAME, Medi_Cal,    Medicare, Private_Coverage+Other_Payer, Unknown_Payer+SelfPay,'','' from 'data/2018-hospital-emergency-department-characteristics-by-facility-pivot-profile.xlsx.json' UNION
select 2019, oshpd_id2, COUNTY_NAME, FACILITY_NAME, Medi_Cal,    Medicare, Private_Coverage+Other_Payer, unknown_inv_Payer+SelfPay,'','' from 'data/2019-hospital-emergency-department-characteristics-by-facility-pivot-profile.xlsx.json' UNION
select 2020, oshpd_id2, COUNTY_NAME, FACILITY_NAME, Medi_Cal,    Medicare, Private_Coverage+Other_Payer, unknown_inv_Payer+SelfPay,'','' from 'data/2020-hospital-emergency-department-characteristics-by-facility-pivot-profile.xlsm.json' UNION
select 2021, oshpd_id2, COUNTY_NAME, FACILITY_NAME, Medi_Cal,    Medicare, Private_Coverage+Other_Payer, Unknown_inv_Payer+SelfPay,'','' from 'data/2021-hospital-emergency-department-characteristics-by-facility-pivot-profile.xlsx.json' 
);

update emer_data set medi_cal = cast(medi_cal as INT);
update emer_data set medicare = cast(medicare as INT);
update emer_data set private_coverage = cast(private_coverage as INT);
update emer_data set uninsured = cast(uninsured as INT);
update emer_data set other_payer = cast(other_payer as INT);
update emer_data set self_pay=0 where self_pay='';
update emer_data set self_pay=null where self_pay=0;
update emer_data set self_pay = cast(self_pay as INT);

update emer_data set county=trim(upper(county));

select * from emer_data;


COPY EMER_DATA TO 'data/output.json' (FORMAT JSON);
COPY EMER_DATA TO 'data/output.tbl' ( DELIMITER '|', HEADER );

select 2005 ,dx_All_Pregnancies	,dx_Births	,dx_Blood_Bloodforming_organs	,dx_Circulatory	,dx_Congenital_anomalies	,dx_Digestive	,dx_Endocrine_Metabolism	,dx_Genitourinary	,dx_Infections	,dx_Injuries_Drugs_Complications	,dx_Musculoskeletal	,dx_Neoplasms	,dx_Nervous_Sensory_Systems	,dx_Other_Reasons	,dx_Perinatal_disorders	,dx_Psychoses_Neuroses	,dx_Respiratory	,dx_Skin_disorders	,dx_Symptoms
from 'data/2005-hospital-emergency-department-characteristics-by-facility-pivot-profile.xlsx.json' ;
select 2006 ,dx_All_Pregnancies	,dx_Births	,dx_Blood_Bloodforming_organs	,dx_Circulatory	,dx_Congenital_anomalies	,dx_Digestive	,dx_Endocrine_Metabolism	,dx_Genitourinary	,dx_Infections	,dx_Injuries_Drugs_Complications	,dx_Musculoskeletal	,dx_Neoplasms	,dx_Nervous_Sensory_Systems	,dx_Other_Reasons	,dx_Perinatal_disorders	,dx_Psychoses_Neuroses	,dx_Respiratory	,dx_Skin_disorders	,dx_Symptoms
from 'data/2006-hospital-emergency-department-characteristics-by-facility-pivot-profile.xlsx.json' ;
select 2007 ,dx_All_Pregnancies	,dx_Births	,dx_Blood_Bloodforming_organs	,dx_Circulatory	,dx_Congenital_anomalies	,dx_Digestive	,dx_Endocrine_Metabolism	,dx_Genitourinary	,dx_Infections	,dx_Injuries_Drugs_Complications	,dx_Musculoskeletal	,dx_Neoplasms	,dx_Nervous_Sensory_Systems	,dx_Other_Reasons	,dx_Perinatal_disorders	,dx_Psychoses_Neuroses	,dx_Respiratory	,dx_Skin_disorders	,dx_Symptoms
from 'data/2007-hospital-emergency-department-characteristics-by-facility-pivot-profile.xlsx.json' ;
select 2008 ,dx_All_Pregnancies	,dx_Births	,dx_Blood_Bloodforming_organs	,dx_Circulatory	,dx_Congenital_anomalies	,dx_Digestive	,dx_Endocrine_Metabolism	,dx_Genitourinary	,dx_Infections	,dx_Injuries_Drugs_Complications	,dx_Musculoskeletal	,dx_Neoplasms	,dx_Nervous_Sensory_Systems	,dx_Other_Reasons	,dx_Perinatal_disorders	,dx_Psychoses_Neuroses	,dx_Respiratory	,dx_Skin_disorders	,dx_Symptoms
from 'data/2008-hospital-emergency-department-characteristics-by-facility-pivot-profile.xlsx.json' ;
select 2009 ,dx_All_Pregnancies	,dx_Births	,dx_Blood_Bloodforming_organs	,dx_Circulatory	,dx_Congenital_anomalies	,dx_Digestive	,dx_Endocrine_Metabolism	,dx_Genitourinary	,dx_Infections	,dx_Injuries_Drugs_Complications	,dx_Musculoskeletal	,dx_Neoplasms	,dx_Nervous_Sensory_Systems	,dx_Other_Reasons	,dx_Perinatal_disorders	,dx_Psychoses_Neuroses	,dx_Respiratory	,dx_Skin_disorders	,dx_Symptoms
from 'data/2009-hospital-emergency-department-characteristics-by-facility-pivot-profile.xlsx.json' ;
select 2010 ,dx_All_Pregnancies	,dx_Births	,dx_Blood_Bloodforming_organs	,dx_Circulatory	,dx_Congenital_anomalies	,dx_Digestive	,dx_Endocrine_Metabolism	,dx_Genitourinary	,dx_Infections	,dx_Injuries_Drugs_Complications	,dx_Musculoskeletal	,dx_Neoplasms	,dx_Nervous_Sensory_Systems	,dx_Other_Reasons	,dx_Perinatal_disorders	,dx_Psychoses_Neuroses	,dx_Respiratory	,dx_Skin_disorders	,dx_Symptoms
from 'data/2010-hospital-emergency-department-characteristics-by-facility-pivot-profile.xlsx.json' ;
select 2011 ,dx_All_Pregnancies	,dx_Births	,dx_Blood_Bloodforming_organs	,dx_Circulatory	,dx_Congenital_anomalies	,dx_Digestive	,dx_Endocrine_Metabolism	,dx_Genitourinary	,dx_Infections	,dx_Injuries_Drugs_Complications	,dx_Musculoskeletal	,dx_Neoplasms	,dx_Nervous_Sensory_Systems	,dx_Other_Reasons	,dx_Perinatal_disorders	,dx_Psychoses_Neuroses	,dx_Respiratory	,dx_Skin_disorders	,dx_Symptoms
from 'data/2011-hospital-emergency-department-characteristics-by-facility-pivot-profile.xlsx.json' ;
select 2012 ,dx_All_Pregnancies	,dx_Births	,dx_Blood_Bloodforming_organs	,dx_Circulatory	,dx_Congenital_anomalies	,dx_Digestive	,dx_Endocrine_Metabolism	,dx_Genitourinary	,dx_Infections	,dx_Injuries_Drugs_Complications	,dx_Musculoskeletal	,dx_Neoplasms	,dx_Nervous_Sensory_Systems	,dx_Other_Reasons	,dx_Perinatal_disorders	,dx_Psychoses_Neuroses	,dx_Respiratory	,dx_Skin_disorders	,dx_Symptoms
from 'data/2012-hospital-emergency-department-characteristics-by-facility-pivot-profile.xlsx.json' ;

select 2013 ,dx_All_Pregnancies	,dx_Births	,dx_Blood_Bloodforming_organs	,dx_Circulatory	,dx_Congenital_anomalies	,dx_Digestive	,dx_Endocrine_Metabolism	,dx_Genitourinary	,dx_Infections	,dx_Injuries_Drugs_Complications	,dx_Musculoskeletal	,dx_Neoplasms	,dx_Nervous_Sensory_Systems	,dx_Other_Reasons	,dx_Perinatal_disorders	,dx_Psychoses_Neuroses	,dx_Respiratory	,dx_Skin_disorders	,dx_Symptoms
from 'data/2013-hospital-emergency-department-characteristics-by-facility-pivot-profile.xlsx.json' ;
select 2014 ,dx_All_Pregnancies	,dx_Births	,dx_Blood_Bloodforming_organs	,dx_Circulatory	,dx_Congenital_anomalies	,dx_Digestive	,dx_Endocrine_Metabolism	,dx_Genitourinary	,dx_Infections	,dx_Injuries_Drugs_Complications	,dx_Musculoskeletal	,dx_Neoplasms	,dx_Nervous_Sensory_Systems	,dx_Other_Reasons	,dx_Perinatal_disorders	,dx_Psychoses_Neuroses	,dx_Respiratory	,dx_Skin_disorders	,dx_Symptoms	
from 'data/2014-hospital-emergency-department-characteristics-by-facility-pivot-profile.xlsx.json' ;
--2015 : N/A 
select 2016 DX_All_Pregnancies	,dx_Births  ,dx_Blood_Disorders	            ,dx_Circulatory_System,DX_Birth_Defects ,   ,dx_Digestive_System,dx_Endocrine_Diseases	,dx_Genitourinary_System	,dx_Infections	,dx_Injuries_Poisonings	    ,dx_Musculoskeletal_System,''       ,dx_Nervous_System	        ,dx_Other_Reasons	,dx_Perinatal_Disorders	,''                     ,dx_Respiratory_System	,dx_Skin_Disorders	,dx_Symptoms
from 'data/2016-hospital-emergency-department-characteristics-by-facility-pivot-profile.xlsx.json' ;
select 2017 DX_All_Pregnancies	,dx_Births  ,dx_Blood_Disorders	            ,dx_Circulatory_System,DX_Birth_Defects ,   ,dx_Digestive_System,dx_Endocrine_Diseases	,dx_Genitourinary_System	,dx_Infections	,dx_Injuries_Poisonings	    ,dx_Musculoskeletal_System,''       ,dx_Nervous_System	        ,dx_Other_Reasons	,dx_Perinatal_Disorders	,''                     ,dx_Respiratory_System	,dx_Skin_Disorders	,dx_Symptoms
from 'data/2017-hospital-emergency-department-characteristics-by-facility-pivot-profile.xlsx.json' ;
select 2018 DX_All_Pregnancies	,dx_Births  ,dx_Blood_Disorders	            ,dx_Circulatory_System,DX_Birth_Defects ,   ,dx_Digestive_System,dx_Endocrine_Diseases	,dx_Genitourinary_System	,dx_Infections	,dx_Injuries_Poisonings	    ,dx_Musculoskeletal_System,''	    ,dx_Nervous_System	        ,dx_Other_Reasons	,dx_Perinatal_Disorders	,''                     ,dx_Respiratory_System	,dx_Skin_Disorders	,dx_Symptoms
from 'data/2018-hospital-emergency-department-characteristics-by-facility-pivot-profile.xlsx.json' ;
select 2019 ,dx_Pregnancy       ,'',        ,dx_Blood_Forming	            ,dx_Circulatory	       ,dx_Congenital,      ,dx_Digestive	,dx_Endocrine	            ,dx_Genitourinary	        ,dx_Infections	,dx_Injury_Poisoning    	,dx_Muscoloskeletal	,''	            ,dx_Nervous_Sense	,dx_No_Group_Assigned	    ,dx_Perinatal	,''	                            ,dx_Respiratory	,dx_Skin	,dx_Symptoms
from 'data/2019-hospital-emergency-department-characteristics-by-facility-pivot-profile.xlsx.json' ;
select 2020 ,dx_Pregnancy_Childbirth, '',dx_Diseases_of_the_Blood           ,dx_Circulatory	    ,dx_Congenital          ,dx_Digestive   ,dx_Endocrine               ,dx_Genitourinary	        ,dx_Infectious	,dx_Injury_Poisoning    	,dx_Musculoskeletal	,''	            ,dx_Nervous_System	,''                         ,dx_Certain_Perinatal_Conditions                ,dx_Respiratory	,dx_Skin	,dx_Symptoms_Signs_NEC
from 'data/2020-hospital-emergency-department-characteristics-by-facility-pivot-profile.xlsm.json' ;
select 2021 ,dx_Pregnancy_Childbirth, '',dx_Diseases_of_the_Blood           ,dx_Circulatory	    ,dx_Congenital          ,dx_Digestive   ,dx_Endocrine               ,dx_Genitourinary	        ,dx_Infectious	,dx_Injury_Poisoning    	,dx_Musculoskeletal	,''	            ,dx_Nervous_System	,''                         ,dx_Certain_Perinatal_Conditions                ,dx_Respiratory	,dx_Skin	,dx_Symptoms_Signs_NEC
from 'data/2021-hospital-emergency-department-characteristics-by-facility-pivot-profile.xlsx.json' ;
