@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vista raiz'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZW_R_MAINT_SHED
  as select from zwmaint_shed as MaintSchedule
    association to parent ZW_R_ASSETS as _Assets on $projection.AssetUUID = _Assets.AssetUUID
    
{
  key maint_uuid            as MaintUUID,
      asset_parent_uuid     as AssetUUID,
      maint_type            as MaintType,
      description           as Description,
      scheduled_date        as ScheduledDate,
      completed_date        as CompletedDate,
      technician            as Technician,
      maint_status          as MaintStatus,
      @Semantics.amount.currencyCode: 'Currency'
      cost                  as Cost,
      currency              as Currency,
      notes                 as Notes,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      
      // Association to the parent asset
      _Assets
      
}
