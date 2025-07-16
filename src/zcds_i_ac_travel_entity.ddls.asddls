@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Travel Entity'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #A,
    sizeCategory: #M,
    dataClass: #MIXED
}
define root view entity zcds_i_ac_travel_entity
  as select from ztab_tavel

{

  key travel_uuid           as TravelUUID,
      travel_id             as TravelID,
      agency_id             as AgencyID,
      customer_id           as CustomerID,
      begin_date            as BeginDate,
      end_date              as EndDate,
      
      @Semantics.amount.currencyCode: 'CurrencyCode'
      booking_fee           as BookingFee,
      
      @Semantics.amount.currencyCode: 'CurrencyCode'
      total_price           as TotalPrice,
      
      currency_code         as CurrencyCode,
      description           as Description,
      overall_status        as OverallStatus,

      @Semantics.user.createdBy: true
      local_created_by      as LocalCreatedBy,

      @Semantics.systemDateTime.createdAt: true
      local_created_at      as LocalCreatedAt,

      @Semantics.user.localInstanceLastChangedBy: true
      local_last_changed_by as LocalLastChangedBy,

      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,

      @Semantics.systemDateTime.lastChangedAt: true
      last_change_at        as LastChangeAt

}
