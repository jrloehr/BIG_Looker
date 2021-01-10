view: fact_sales_detail {
  sql_table_name: dbo.FactSalesDetail ;;

  measure: cogs {
    type:  sum
    value_format: "$#,##0.00"
    sql: ${TABLE}.COGS ;;
  }

  dimension: customer_id {
    type: number
    value_format_name: id
    sql: ${TABLE}.Customer_id ;;
  }

  dimension: customer_type_id2 {
    type: number
    value_format_name: id
    sql: ${TABLE}.Customer_Type_Id2 ;;
  }

  measure: discounts {
    type:  number
    value_format: "$#,##0.00"
    sql: ${TABLE}.Discounts ;;
  }

  dimension: document_number {
    type: string
    value_format_name: id
    sql: ${TABLE}.Document_Number ;;
  }

  dimension: etail_order_id {
    type: string
    value_format_name: id
    sql: ${TABLE}.etail_order_id ;;
  }

  measure: gross_sales {
    type:  sum
    value_format: "$#,##0.00"
    sql: ${TABLE}.Gross_Sales ;;
  }

  dimension: item_id {
    type: number
    value_format_name: id
    sql: ${TABLE}.item_id ;;
  }

  measure: item_qty {
    type: number
    sql: ${TABLE}.Item_Qty ;;
  }

  dimension: location_id {
    type: number
    value_format_name: id
    sql: ${TABLE}.Location_id ;;
  }

  measure: margin_dollars {
    type:  number
    value_format: "$#,##0.00"
    sql: ${TABLE}.Margin_Dollars ;;
  }

  measure: net_sales_b4_returns {
    type:  number
    value_format: "$#,##0.00"
    sql: ${TABLE}.Net_Sales_B4_Returns ;;
  }

  dimension_group: ordered {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.OrderedDate ;;
  }

  dimension_group: shipped {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.ShippedDate ;;
  }

  dimension: shipped_flag {
    type: number
    sql: ${TABLE}.ShippedFlag ;;
  }

  measure: shipping {
    type:  number
    value_format: "$#,##0.00"
    sql: ${TABLE}.Shipping ;;
  }

  dimension: subsidiary_id {
    type: number
    sql: ${TABLE}.subsidiary_id ;;
  }

  measure: taxes {
    type:  number
    value_format: "$#,##0.00"
    sql: ${TABLE}.Taxes ;;
  }

  measure: total_sales_b4_returns {
    type:  sum
    value_format: "$#,##0.00"
    sql: ${TABLE}.Total_Sales_B4_Returns ;;
  }

  dimension: transaction_id {
    type: number
    value_format_name: id
    sql: ${TABLE}.transaction_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
