
* Linking Companies by CUSIP or ISIN
*********************************
* 1 prepare example data 
*********************************
clear all
input str20 company_name str20 cusip str20 ISIN
Apple 037833100 US0378331005
IBM 459200101 US4592001014
Microsoft 594918104 US5949181045
Tesla 88160R101 US88160R1014
end  

list
*********************************
* (1) 9-digit CUSIP -> 8-digist or 6 digit
*********************************
*********************************
* Suggest to firstly collect Cusip from WRDS Compustat Daily Updates - Fundamentals Annual 
*CUSIP: a unique nine-character alphanumeric code that identifies a North American financial security
*  Compustat uses 9-digit CUSIP
*********************************


*convert to 8-digit CUSIP used in CRSP database

gen cusip_8_digit=substr(cusip,1,8)

*convert to 6-digit CUSIP used in SDC database

gen cusip_6_digit=substr(cusip,1,6)


*********************************
* (2) ISIN to CUSIP
*********************************
*********************************
* Suggest to firstly collect ISIN from WRDS Compustat Global - Fundamentals Annual
*ISIN: International Securities Identification Number
*********************************

gen cusip_9_digit_from_isin=substr(ISIN,3,9)


*********************************
* (3) Now we get the common linking ids, we can proceed to merge Compustat company data with CRSP, SDC, or other datasource by the common id and dates (year or month)
*********************************
* Show all links to other datasets
list company_name cusip cusip_8_digit cusip_6_digit cusip_9_digit_from_isin

save company_ids.dta,replace