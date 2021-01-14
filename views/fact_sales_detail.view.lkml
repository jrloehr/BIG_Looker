view: fact_sales_detail {
  sql_table_name: dbo.FactSalesDetail ;;

  dimension: cogs {
    type: string
    sql: ${TABLE}.COGS ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.Customer_id ;;
  }

  dimension: customer_type_id2 {
    type: number
    value_format_name: id
    sql: ${TABLE}.Customer_Type_Id2 ;;
  }

  dimension: discounts {
    type: string
    sql: ${TABLE}.Discounts ;;
  }

  measure: sum_discounts {
    type: number
    sql: SUM(${discounts});;
  }

  dimension: document_number {
    type: string
    sql: ${TABLE}.Document_Number ;;
  }

  dimension: etail_order_id {
    type: string
    sql: ${TABLE}.etail_order_id ;;
  }

  measure: count_etail_order_id {
    type: number
    sql: count(${etail_order_id}) ;;
  }

  dimension: gross_sales {
    type: string
    sql: ${TABLE}.Gross_Sales ;;
  }

  measure: sum_gross_sales {
    type: number
    sql: SUM(${gross_sales});;
  }

  dimension: item_id {
    type: number
    sql: ${TABLE}.item_id ;;
  }

  dimension: item_qty {
    type: number
    sql: ${TABLE}.Item_Qty ;;
  }

  dimension: location_id {
    type: number
    sql: ${TABLE}.Location_id ;;
  }

  dimension: margin_dollars {
    type: string
    sql: ${TABLE}.Margin_Dollars ;;
  }

  dimension: net_sales_b4_returns {
    type: string
    sql: ${TABLE}.Net_Sales_B4_Returns ;;
  }

  measure: sum_net_sales_b4_returns {
    type: number
    sql: sum(${net_sales_b4_returns}) ;;
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

  dimension: shipping {
    type: string
    sql: ${TABLE}.Shipping ;;
  }

  measure: sum_shipping {
    type: number
    sql: sum(${shipping}) ;;
  }

  dimension: subsidiary_id {
    type: number
    sql: ${TABLE}.subsidiary_id ;;
  }

  dimension: taxes {
    type: string
    sql: ${TABLE}.Taxes ;;
  }

  measure: sum_taxes {
    type: number
    sql: sum(${taxes}) ;;
  }

  dimension: total_sales_b4_returns {
    type: string
    sql: ${TABLE}.Total_Sales_B4_Returns ;;
  }

  measure: sum_total_sales_b4_returns {
    type: number
    sql: sum(${total_sales_b4_returns}) ;;
  }

  dimension: transaction_id {
    type: number
    sql: ${TABLE}.transaction_id ;;
  }

  measure: count_transaction_id {
    type: number
    sql: count(${transaction_id}) ;;
  }

  measure: returns {
    type: number
    sql: -(${gross_sales} - ${discounts} - ${net_sales_b4_returns});;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
