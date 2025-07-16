@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'projection consumption'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true // Habilita extensiones en la proyección en un nuevo CDS de tipo metadata
define root view entity zcds_c_ac_travel //Debe ser la entidad raíz de la proyección (ROOT)
  provider contract transactional_query
  //contrato del proveedor transaccional ( para habilitar query en la capa de los servicios odata ))

  as projection on zcds_i_ac_travel_entity
{
  key TravelUUID,
      TravelID,

      @Consumption.valueHelpDefinition: [{ entity: {    name: '/DMO/I_Agency_StdVH',
                                                     element: 'AgencyID' },
                                           useForValidation: true }]
      AgencyID,
      
      CustomerID,
      BeginDate,
      EndDate,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,

      @Consumption.valueHelpDefinition: [{ entity: {    name: 'I_CurrencyStdVH',
                                                     element: 'Currency' },
                                           useForValidation: true }]
      CurrencyCode,
      
      Description,
      OverallStatus,
      LocalCreatedBy,
      LocalCreatedAt,
      LocalLastChangedBy,
      LocalLastChangedAt,
      LastChangeAt
}
