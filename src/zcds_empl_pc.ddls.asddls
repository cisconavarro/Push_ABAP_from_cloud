@EndUserText.label: 'view consumo empl'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true

define root view entity zcds_empl_pc
  as projection on zcds_empl_pr

{

  key e_number      as EmployeeNumber,
      e_name        as Name,
      e_lastname    as Lastname,
      e_department  as Department,
      e_code        as EmployeeCode,
      e_email       as Email,
      status        as Status,
      job_code      as JobCode,
      job_title     as Job_title,
      start_date    as StartDate,
      end_date      as EndDate


}
