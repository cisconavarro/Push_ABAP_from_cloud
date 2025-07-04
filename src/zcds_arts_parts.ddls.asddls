@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS arts parts'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #TRANSACTIONAL
}
define view entity zcds_arts_parts
  as select from zarts_parts
{
  key id_art          as IdArt,
      descr           as Descr,
      descr2          as Descr2,
      color           as Color,
      piezas          as Piezas,
      stock           as Stock,
      url             as Url,
      created_by      as CreatedBy,
      created_at      as CreatedAt,
      last_changed_by as LastChangedBy,
      last_changed_at as LastChangedAt,
      case when stock = 0 then 0               // neutral   grey
           when stock between 1  and 10 then 1 // low stock red
           when stock between 11 and 50 then 2 // medium stock yellow
           when stock > 50 then 3              // high stock green
           else 0 end as StockStatus
      
}
