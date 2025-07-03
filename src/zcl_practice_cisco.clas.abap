CLASS zcl_practice_cisco DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    TYPES ty_amount TYPE p LENGTH 8 DECIMALS 2.

    INTERFACES if_oo_adt_classrun.

* Static method to run the class
    CLASS-METHODS:
      arithmetic_operations  IMPORTING iv_numer1        TYPE dmbtr
                                       iv_numer2        TYPE dmbtr
                                       operator         TYPE char3
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

    DATA: part1 TYPE string VALUE `Hello`,
          part2 TYPE string VALUE `World`.

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
                                             operator  = '+' ).

    out->write( lv_result ).

    out->write( '**********************************************************************' ).

* Example 10: arithmetic operations subtraction
**********************************************************************

    out->write( 'Example 10: arithmetic operations subtraction' ).

    CLEAR lv_result.
    lv_result = arithmetic_operations( iv_numer1 = 43
                                       iv_numer2 = 34
                                       operator  = '-' ).

    out->write( lv_result ).

    out->write( '**********************************************************************' ).

* Example 11: arithmetic operations multiplication
**********************************************************************

    out->write( 'Example 11: arithmetic operations multiplication' ).

    CLEAR lv_result.
    lv_result = arithmetic_operations( iv_numer1 = 1432
                                       iv_numer2 = 34
                                       operator  = '*' ).

    out->write( lv_result ).

    out->write( '**********************************************************************' ).

* Example 12: arithmetic operations division
**********************************************************************

    out->write( 'Example 12: arithmetic operations division' ).

    CLEAR lv_result.
    lv_result = arithmetic_operations( iv_numer1 = 873
                                       iv_numer2 = 37
                                       operator  = '/' ).

    out->write( lv_result ).

    out->write( '**********************************************************************' ).

* Example 13: arithmetic operations integer division
**********************************************************************
    out->write( 'Example 13: arithmetic operations integer division' ).

    CLEAR lv_result.
    lv_result = arithmetic_operations( iv_numer1 = 873
                                       iv_numer2 = 37
                                       operator  = 'DIV' ).

    out->write( lv_result ).

    out->write( '**********************************************************************' ).


* Example 14: arithmetic operations modulo
**********************************************************************

    out->write( 'Example 14: arithmetic operations modulo' ).
    CLEAR lv_result.
    lv_result = arithmetic_operations( iv_numer1 = 873
                                       iv_numer2 = 37
                                       operator  = 'MOD' ).

    out->write( lv_result ).

    out->write( '**********************************************************************' ).

* Example 15: arithmetic operations exponentiation
**********************************************************************
    out->write( 'Example 15: arithmetic operations exponentiation' ).

    CLEAR lv_result.
    lv_result = arithmetic_operations( iv_numer1 = 3
                                       iv_numer2 = 9
                                       operator  = '**' ).

    out->write( lv_result ).

    out->write( '**********************************************************************' ).

  ENDMETHOD.

  METHOD arithmetic_operations.

    CASE operator.
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

ENDCLASS.
