view: fact_sales_detail {
  sql_table_name: dbo.FactSalesDetail ;;

  dimension: cogs {
    label: "Cost of Goods Sold"
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
    label: "Discounts & Returns"
    type: number
    value_format_name: usd_0
    sql: ${TABLE}.Discounts ;;
  }

  measure: sum_discounts {
    label: "Total Discounts & Returns"
    type: sum
    value_format_name: usd_0
    sql: ${discounts};;
  }

  measure: avg_discounts {
    label: "Average Discounts & Returns"
    type: average
    value_format_name: usd_0
    sql: ${discounts};;
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
    type: count_distinct
    sql: ${etail_order_id};;
  }

  dimension: gross_sales {
    label: "Gross Sales"
    type: string
    value_format_name: usd_0
    sql: ${TABLE}.Gross_Sales ;;

  }

  measure: sum_gross_sales {
    label: "Total Gross Sales"
    type: sum
    sql: ${gross_sales};;
    value_format_name: usd_0
    description: "Description of Gross Sales"
  }

  measure: avg_gross_sales {
    label: "Average Gross Sales"
    type: average
    value_format_name: usd_0
    sql: ${gross_sales};;
  }

  dimension: item_id {
    label: "Item ID"
    type: number
    sql: ${TABLE}.item_id ;;
  }

  dimension: item_qty {
    label: "Item Quantity"
    type: number
    sql: ${TABLE}.Item_Qty ;;
  }

  measure: sum_item_qty {
    label: "Total Item Quantity"
    type: sum
    sql: ${TABLE}.Item_Qty ;;
  }

  measure: avg_item_qty {
    label: "Average Item Quantity"
    type: average
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
    label: "Net Sales"
    type: string
    value_format_name: usd_0
    sql: ${TABLE}.Net_Sales_B4_Returns ;;
  }

  measure: sum_net_sales_b4_returns {
    label: "Total Net Sales"
    type: sum
    value_format_name: usd_0
    sql: ${net_sales_b4_returns} ;;
  }

  measure: avg_net_sales_b4_returns {
    label: "Average Net Sales"
    type: average
    value_format_name: usd_0
    sql: ${net_sales_b4_returns} ;;
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
    label: "Shipping"
    type: number
    value_format_name: usd_0
    sql: ${TABLE}.Shipping ;;
  }

  measure: sum_shipping {
    label: "Total Shipping"
    type: sum
    value_format_name: usd_0
    sql: ${shipping} ;;
  }

  measure: avg_shipping {
    label: "Average Shipping"
    type: average
    value_format_name: usd_0
    sql: ${shipping} ;;
  }

  dimension: subsidiary_id {
    type: number
    sql: ${TABLE}.subsidiary_id ;;
  }

  dimension: taxes {
    label: "Taxes"
    type: number
    value_format_name: usd_0
    sql: ${TABLE}.Taxes ;;
  }

  measure: sum_taxes {
    label: "Total Taxes"
    type: sum
    value_format_name: usd_0
    sql: ${taxes} ;;
  }

  measure: avg_taxes {
    label: "Average Taxes"
    type: average
    value_format_name: usd_0
    sql: ${taxes} ;;
  }

  dimension: total_sales_b4_returns {
    label: "Total Sales"
    type: number
    value_format_name: usd_0
    sql: ${TABLE}.Total_Sales_B4_Returns ;;
  }

  measure: sum_total_sales_b4_returns {
    label: "Grand Total Sales"
    type: sum
    value_format_name: usd_0
    sql: ${total_sales_b4_returns} ;;
  }

  measure: avg_total_sales_b4_returns {
    label: "Average Total Sales"
    type: average
    value_format_name: usd_0
    sql: ${total_sales_b4_returns} ;;
  }

  dimension: transaction_id {
    label: "Transaction ID"
    type: number
    sql: ${TABLE}.transaction_id ;;
  }

  measure: countd_transaction_id {
    label: "# of Transactions"
    type: count_distinct
    sql: ${transaction_id} ;;
  }

  # dimension: returns {
  #   type: number
  #   sql: -(${gross_sales} - ${discounts} - ${net_sales_b4_returns});;
  # }

  # measure: sum_returns {
  #   type: number
  #   sql: SUM(-(${gross_sales} - ${discounts} - ${net_sales_b4_returns}));;
  # }

  measure: count {
    type: count
    drill_fields: []
  }
}
