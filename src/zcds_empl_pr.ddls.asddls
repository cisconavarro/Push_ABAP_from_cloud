@AbapCatalog.sqlViewName: 'zcds_empl'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS ROOT'

define root view zcds_empl_pr 
    as select from zempl_cisco
{
   
  key e_number,
  e_name,
  e_lastname,
  e_department,
  e_code,
  e_email,
  status,
  job_code,
  job_title,
  start_date,
  end_date
     
}
