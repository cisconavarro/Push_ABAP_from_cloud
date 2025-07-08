CLASS zcl_practice_cisco DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

**********************
* TYPES DEFINITION
**********************

    TYPES: ty_amount     TYPE p LENGTH 8 DECIMALS 2.
    TYPES: ty_arts_parts TYPE zarts_parts.

**********************
* TYPES TABLE DEFINITION
**********************

    TYPES: ty_t_zarts_parts TYPE STANDARD TABLE OF ty_arts_parts WITH DEFAULT KEY.

**********************
* INTERFACES DEFINITION
**********************

    INTERFACES if_oo_adt_classrun.

**********************
* STATIC METHODS
**********************

    CLASS-METHODS:

* 01 Arithmetic Operations
      arithmetic_operations  IMPORTING iv_numer1        TYPE dmbtr
                                       iv_numer2        TYPE dmbtr
                                       operator_sig     TYPE char3
                             RETURNING VALUE(rv_result) TYPE string,

* 02 Insert Rows to Table
      append_rows_to_table IMPORTING is_values        TYPE zarts_parts
                           RETURNING VALUE(rv_result) TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS zcl_practice_cisco IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

* Example 1: String
**********************************************************************
    out->write( '**********************************************************************' ).

    out->write( 'Example 1: String' ).
    out->write( 'Qlq mi gente' ).

    out->write( '**********************************************************************' ).

* Example 2: Variable based on global type
**********************************************************************

    out->write( 'Example 2: Variable based on global type' ).

*   Data declaration
    DATA airport TYPE /dmo/airport_id VALUE 'FRA'.
    out->write( airport ).

    out->write( '**********************************************************************' ).

* Example 3: Constants
**********************************************************************

    out->write( 'Example 3: Constants' ).

*   Constants declaration

    CONSTANTS c_text   TYPE string VALUE 'Hello World'.
    CONSTANTS c_number TYPE i      VALUE 2600.

    out->write( c_text ).
    out->write( c_number ).

    out->write( '**********************************************************************' ).

* Example 4: Literals
**********************************************************************

    out->write( 'Example 4: Literals' ).

    out->write(  '12345               ' ).    "Text Literal   (Type C)
    out->write(  '12345            '    ).    "String Literal (Type STRING)
    out->write(  12345                  ).    "Number Literal (Type I)

    out->write( '**********************************************************************' ).

* Example 5: Implicit Type Conversions
**********************************************************************

    out->write( 'Example 5: Implicit Type Conversions' ).

    DATA: lv_int    TYPE i,
          lv_pack   TYPE p LENGTH 8 DECIMALS 2,
          lv_char   TYPE c LENGTH 10 VALUE 'abcde12345',
          lv_string TYPE string.

    lv_int = 43.
    lv_pack = '1234.56'.
    lv_string = 'wenas wenas'.

    out->write( lv_int ).
    out->write( lv_pack ).
    out->write( lv_char ).
    out->write( lv_string ).

    out->write( '**********************************************************************' ).

* Example 6: String Templates
**********************************************************************
    out->write( 'Example 6: String Templates and inline declarations' ).

*   Data declaration

    DATA: amount  TYPE ty_amount VALUE '3.30',
          amount1 TYPE ty_amount VALUE '1.21',
          amount2 TYPE ty_amount VALUE '2.10'.

    DATA(text) = |Hola a todos|.
    out->write( text ).

    CLEAR text.
    text = |Total: { amount } EUR|.
    out->write( text ).

    CLEAR text.
    text = |Total: { amount1 + amount2 } EUR|.
    out->write( text ).

    out->write( '**********************************************************************' ).

* Example 7: Format Options
**********************************************************************
    out->write( 'Example 7: Format Options' ).

    DATA the_date  TYPE d                     VALUE '19891109'.
    DATA my_number TYPE p LENGTH 3 DECIMALS 2 VALUE '-273.15'.

    out->write( 'Date' ).

    CLEAR text.
    text = |Raw Date: { the_date             }|. " Internal format
    out->write( text ).

    CLEAR text.
    text = |ISO Date: { the_date DATE = ISO  }|. " ISO format
    out->write( text ).

    CLEAR text.
    text = |USER Date:{ the_date DATE = USER }|. " External format
    out->write( text ).

    out->write( 'Number' ).

    CLEAR text.
    text = |Raw Number { my_number                    }|.
    out->write( text ).

    CLEAR text.
    text = |User Format{ my_number NUMBER = USER      }|.
    out->write( text ).

    CLEAR text.
    text = |Sign Right { my_number SIGN = RIGHT       }|.
    out->write( text ).

    CLEAR text.
    text = |Scientific { my_number STYLE = SCIENTIFIC }|.
    out->write( text ).

    out->write( '**********************************************************************' ).

* Example 8: String Expressions - concatenation Operator
**********************************************************************
    out->write( 'Example 8: String Expressions - concatenation Operator' ).

    DATA: part1 TYPE string VALUE 'Hello',
          part2 TYPE string VALUE 'World'.

    CLEAR text.
    text = part1 && part2.
    out->write( text ).

    CLEAR text.
    text = part1 && | | && part2.
    out->write( text ).

    CLEAR text.
    text = |{ amount1 } + { amount2 }| && | = | && |{ amount1 + amount2 }|.
    out->write( text ).

    out->write( '**********************************************************************' ).

* Example 9: arithmetic operations addition
**********************************************************************

    out->write( 'Example 9: arithmetic operations addition' ).

    DATA(lv_result) = arithmetic_operations( iv_numer1 = 10
                                             iv_numer2 = 5
                                             operator_sig  = '+' ).

    out->write( lv_result ).

    out->write( '**********************************************************************' ).

* Example 10: arithmetic operations subtraction
**********************************************************************

    out->write( 'Example 10: arithmetic operations subtraction' ).

    CLEAR lv_result.
    lv_result = arithmetic_operations( iv_numer1 = 43
                                       iv_numer2 = 34
                                       operator_sig  = '-' ).

    out->write( lv_result ).

    out->write( '**********************************************************************' ).

* Example 11: arithmetic operations multiplication
**********************************************************************

    out->write( 'Example 11: arithmetic operations multiplication' ).

    CLEAR lv_result.
    lv_result = arithmetic_operations( iv_numer1 = 1432
                                       iv_numer2 = 34
                                       operator_sig  = '*' ).

    out->write( lv_result ).

    out->write( '**********************************************************************' ).

* Example 12: arithmetic operations division
**********************************************************************

    out->write( 'Example 12: arithmetic operations division' ).

    CLEAR lv_result.
    lv_result = arithmetic_operations( iv_numer1 = 873
                                       iv_numer2 = 37
                                       operator_sig  = '/' ).

    out->write( lv_result ).

    out->write( '**********************************************************************' ).

* Example 13: arithmetic operations integer division
**********************************************************************
    out->write( 'Example 13: arithmetic operations integer division' ).

    CLEAR lv_result.
    lv_result = arithmetic_operations( iv_numer1 = 873
                                       iv_numer2 = 37
                                       operator_sig  = 'DIV' ).

    out->write( lv_result ).

    out->write( '**********************************************************************' ).

* Example 14: arithmetic operations modulo
**********************************************************************

    out->write( 'Example 14: arithmetic operations modulo' ).
    CLEAR lv_result.
    lv_result = arithmetic_operations( iv_numer1 = 873
                                       iv_numer2 = 37
                                       operator_sig  = 'MOD' ).

    out->write( lv_result ).

    out->write( '**********************************************************************' ).

* Example 15: arithmetic operations exponentiation
**********************************************************************
    out->write( 'Example 15: arithmetic operations exponentiation' ).

    CLEAR lv_result.
    lv_result = arithmetic_operations( iv_numer1 = 3
                                       iv_numer2 = 9
                                       operator_sig  = '**' ).

    out->write( lv_result ).

    out->write( '**********************************************************************' ).

* Example 16: Append rows to standart table
**********************************************************************
    out->write( 'Example 16: Append rows to standart table' ).

************ warning: This example will delete all rows in the table zarts_parts ************
    DELETE FROM zarts_parts.
************ warning: This example will delete all rows in the table zarts_parts ************

    DATA(ls_values_part) = VALUE ty_arts_parts( ).

    GET TIME STAMP FIELD DATA(lv_timestamp).
    DATA(lv_user) = cl_abap_context_info=>get_user_technical_name( ).

    ls_values_part = VALUE #( descr                 = 'Agenda 2025 Azul Aqua'
                              descr2                = 'Agenda 2025 Azul Aqua Hard Cover'
                              color                 = 'Azul Aqua'
                              piezas                = 10
                              stock                 = 123
                              url                   = 'https://lalibreteria.mx/cdn/shop/files/la-libreteria-agenda-2025-hard-cover-azul-aqua-03_700x.jpg?v=1720633282'
                              total_price           = '230.00'
                              price_piece           = '230.00'
                              currency_code         = 'CLP'
                              measure_unit          = 'FA'
                              quantity_per_unit     = 1
                              local_created_by      = lv_user
                              local_created_at      = lv_timestamp
                              local_last_changed_by = lv_user
                              local_last_changed_at = lv_timestamp
                              last_change_at        = lv_timestamp ).

    DATA(lv_append_result) = append_rows_to_table( ls_values_part ).
    out->write( lv_append_result ).

    CLEAR: ls_values_part, lv_append_result.

    ls_values_part = VALUE #( descr                 = '1 Pack Libreta Barcelona'
                              descr2                = '1 Pack Libreta Barcelona Refill'
                              color                 = 'Marrón'
                              piezas                = 3
                              stock                 = 48
                              url                   = 'https://lalibreteria.mx/cdn/shop/products/la-libreteria-libretas-9x20-5-barcelona-02_700x.jpg?v=1648007109'
                              total_price           = '285.00'
                              price_piece           = '285.00'
                              currency_code         = 'CLP'
                              measure_unit          = 'PCK'
                              quantity_per_unit     = 1
                              local_created_by      = lv_user
                              local_created_at      = lv_timestamp
                              local_last_changed_by = lv_user
                              local_last_changed_at = lv_timestamp
                              last_change_at        = lv_timestamp ).

    lv_append_result = append_rows_to_table( ls_values_part ).
    out->write( lv_append_result ).

    out->write( '**********************************************************************' ).

  ENDMETHOD.

  METHOD arithmetic_operations.

    CASE operator_sig.
      WHEN '+'.
        rv_result = |Addition result: { iv_numer1 + iv_numer2 }|.

      WHEN '-'.
        rv_result = |Subtraction result: { iv_numer1 - iv_numer2 }|.

      WHEN '*'.
        rv_result = |Multiplication result: { iv_numer1 * iv_numer2 }|.

      WHEN '/'.
        TRY.
            rv_result = |Division result { iv_numer1 / iv_numer2 }|.
          CATCH cx_sy_zerodivide INTO DATA(lo_zerodivide).
            rv_result = 'Division by zero is not allowed'.
        ENDTRY.

      WHEN 'DIV'. " Divides two numeric values and returns the integer part of the result
        TRY.
            rv_result = |Integer Division result: { iv_numer1 DIV iv_numer2 }|.
          CATCH cx_sy_zerodivide INTO lo_zerodivide.
            rv_result = 'Division by zero is not allowed'.
        ENDTRY.

      WHEN 'MOD'. " Returns the remainder of the division of two numeric values
        TRY.
            rv_result = |Modulo result: { iv_numer1 MOD iv_numer2 }|.
          CATCH cx_sy_zerodivide INTO lo_zerodivide.
            rv_result = 'Division by zero is not allowed'.
        ENDTRY.

      WHEN '**'.
        rv_result = |Exponentiation result: { iv_numer1 ** iv_numer2 }|.

      WHEN OTHERS.
        rv_result = 'Invalid operator'.

    ENDCASE.

  ENDMETHOD.

  METHOD append_rows_to_table.

    DATA(ls_arts_parts) = VALUE ty_arts_parts( ).

    SELECT MAX( id_art ) AS max_id FROM zarts_parts INTO @DATA(lv_max_id).
    IF lv_max_id IS INITIAL.
      lv_max_id = 1.
    ELSE.
      lv_max_id = lv_max_id + 1.
    ENDIF.

    ls_arts_parts = CORRESPONDING #( is_values ).

    ls_arts_parts-client = sy-mandt.
    ls_arts_parts-id_art = |{ lv_max_id ALPHA = IN }|.

    TRY.
        MODIFY zarts_parts FROM @ls_arts_parts.
        COMMIT WORK AND WAIT.
        rv_result = |Row with ID { lv_max_id } inserted successfully|.
      CATCH cx_sy_dynamic_osql_error INTO DATA(ol_sql_error).
        rv_result = |Error inserting row: { ol_sql_error->get_text( ) }|.
    ENDTRY.

  ENDMETHOD.

ENDCLASS.
