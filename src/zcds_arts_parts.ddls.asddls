@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS arts parts'
@Metadata.allowExtensions: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #TRANSACTIONAL
}
define view entity zcds_arts_parts
  as select from zarts_parts
{

  key id_art                as IdArt,
      descr                 as Descr,
      descr2                as Descr2,
      color                 as Color,
      piezas                as Piezas,
      stock                 as Stock,
      url                   as Url,
      total_price           as Total_Price,
      price_piece           as Price_Piece,
      measure_unit          as Measure_Unit,
      quantity_per_unit     as Quantity_Per_Unit,
      currency_code         as Currency_Code,
      local_created_by      as Created_By,
      local_created_at      as Created_At,
      local_last_changed_by as Last_Changed_By,
      local_last_changed_at as local_Last_Change_At,
      last_change_at        as Last_Change_At,
      case when stock = 0 then 0               // neutral   grey
           when stock between 1  and 10 then 1 // low stock red
           when stock between 11 and 50 then 2 // medium stock yellow
           when stock > 50 then 3              // high stock green
           else 0 end       as StockStatus

}
