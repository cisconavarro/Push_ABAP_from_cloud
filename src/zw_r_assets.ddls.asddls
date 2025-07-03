@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vista raiz acercamiento a BD'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZW_R_ASSETS
  as select from zwassets as Assets
   composition [0..*] of ZW_R_MAINT_SHED as _MaintSchedule
{
  key asset_uuid            as AssetUUID,
      asset_code            as AssetCode,
      asset_type            as AssetType,
      description           as Description,
      category              as Category,
      nanufacturer          as Nanufacturer,
      model                 as Model,
      serial_mnber          as SerialMnber,
      acquisition_date      as AcquisitionDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      purchase_cost         as PurchaseCost,
      currency_code         as CurrencyCode,
      location              as Location,
      assigned_user         as AssignedUser,
      status                as Status,
      warranty_end_date     as WarrantyEndDate,
      criticality           as Criticality,
      last_maintenance_date as LastMaintenanceDate,
      next_maintenance_date as NextMaintenanceDate,
      @Semantics.user.createdBy: true
      created_by            as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at            as CreatedAt,
      @Semantics.user.lastChangedBy: true
      last_changed_by       as LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      
      // Association to Maintenance Schedules
      _MaintSchedule
}
