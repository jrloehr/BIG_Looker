view: fact_sales_detail {
  sql_table_name: dbo.FactSalesDetail ;;

  dimension: cogs {
    label: "Cost of Goods Sold"
    type: string
    sql: ${TABLE}.COGS ;;
  }

  dimension: net_sales_b4_returns {
    label: "Net Sales"
    type: string
    value_format_name: usd
    sql: ${TABLE}.Net_Sales_B4_Returns ;;
  }

  measure: sum_net_sales_b4_returns {
    label: "Total Net Sales"
    type: sum
    value_format_name: usd
    sql: ${net_sales_b4_returns} ;;
  }

  measure: runningtotal_net_sales_b4_returns {
    label: "Running Total Net Sales"
    type: running_total
    value_format_name: usd
    sql: ${sum_net_sales_b4_returns} ;;
  }

  measure: shp_avg_net_sales_b4_returns {
    label: "Average Net Sales"
    type: number
    value_format_name: usd
    sql: ${sum_net_sales_b4_returns} / ${countd_transaction_id} ;;
  }

  dimension: shipping {
    label: "Shipping"
    type: number
    value_format_name: usd
    sql: ${TABLE}.Shipping ;;
  }

  measure: sum_shipping {
    label: "Total Shipping"
    type: sum
    value_format_name: usd
    sql: ${shipping} ;;
  }

  measure: runningtotal_total_shipping {
    label: "Running Total Shipping"
    type: running_total
    value_format_name: usd
    sql: ${sum_shipping} ;;
  }

  measure: shp_avg_shipping {
    label: "Average Shipping"
    type: number
    value_format_name: usd
    sql: ${sum_shipping} / ${countd_transaction_id} ;;
  }

  dimension: taxes {
    label: "Taxes"
    type: number
    value_format_name: usd
    sql: ${TABLE}.Taxes ;;
  }

  measure: sum_taxes {
    label: "Total Taxes"
    type: sum
    value_format_name: usd
    sql: ${taxes} ;;
  }

  measure: runningtotal_total_taxes {
    label: "Running Total Taxes"
    type: running_total
    value_format_name: usd
    sql: ${sum_taxes} ;;
  }

  measure: shp_avg_taxes {
    label: "Average Taxes"
    type: number
    value_format_name: usd
    sql: ${sum_taxes} / ${countd_transaction_id} ;;
  }

  dimension: total_sales {
    label: "Sales Amount"
    type: number
    value_format_name: usd
    sql: ${TABLE}.Total_Sales_B4_Returns ;;
  }

  measure: sum_total_sales {
    label: "Total Sales"
    type: sum
    value_format_name: usd
    sql: ${total_sales} ;;
  }

#### THIS CAN BE USED FOR CHANGING YEARS OF SALES DYNAMICALLY
  filter: select_sales_year {
    description: "Use with filtered sales"
    type: number
    suggestions: ["2014", "2015", "2016", "2017", "2018", "2019", "2020", "2021"]
  }

  dimension: sales_year_selected {
    hidden: yes
    sql: CASE
            WHEN {% condition select_sales_year %} ${ordered_year} {% endcondition %} THEN 1
            ELSE 0
          END ;;
  }

  measure: filtered_sales {
    label: "Filtered Sales"
    type: sum
    sql: ${total_sales} ;;
    value_format_name: usd
    filters: [sales_year_selected: "1"]
  }

  measure: runningtotal_total_sales {
    label: "Running Total Sales"
    type: running_total
    value_format_name: usd
    sql: ${sum_total_sales} ;;
  }

  measure: shp_avg_total_sales {
    label: "Average Total Sales"
    type: number
    value_format_name: usd
    sql: ${sum_total_sales} / ${countd_transaction_id} ;;
  }

  dimension: item_qty {
    label: "Item Quantity"
    type: number
    value_format_name: decimal_0
    sql: ${TABLE}.Item_Qty ;;
  }

  measure: sum_item_qty {
    label: "Total Item Quantity"
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}.Item_Qty ;;
  }

  measure: runningtotal_item_qty {
    label: "Running Total Item Quantity"
    type: running_total
    value_format_name: decimal_0
    sql: ${sum_item_qty} ;;
  }


  measure: shp_avg_item_qty {
    label: "Average Item Quantity"
    type: number
    value_format_name: decimal_0
    sql: ${sum_item_qty} / ${countd_transaction_id} ;;
  }

  dimension: gross_sales {
    label: "Gross Sales"
    type: string
    value_format_name: usd
    sql: ${TABLE}.Gross_Sales ;;
  }

  measure: sum_gross_sales {
    label: "Total Gross Sales"
    type: sum
    sql: ${gross_sales};;
    value_format_name: usd
    description: "Description of Gross Sales"
  }

  measure: runningtotal_gross_sales {
    label: "Running Total Gross Sales"
    type: running_total
    value_format_name: usd
    sql: ${sum_gross_sales} ;;
  }

  measure: shp_avg_gross_sales {
    label: "Average Gross Sales"
    type: number
    value_format_name: usd
    sql: ${sum_gross_sales} / ${countd_transaction_id};;
  }

  dimension: discounts {
    label: "Discounts & Returns"
    type: number
    value_format_name: usd
    sql: ${TABLE}.Discounts ;;
  }

  measure: sum_discounts {
    label: "Total Discounts & Returns"
    type: sum
    value_format_name: usd
    sql: ${discounts};;
  }

  measure: runningtotal_discounts {
    label: "Running Total Discounts & Returns"
    type: running_total
    value_format_name: usd
    sql: ${sum_discounts} ;;
  }

  measure: shp_avg_discounts {
    label: "Average Discounts & Returns"
    type: number
    value_format_name: usd
    sql: ${sum_discounts} / ${countd_transaction_id};;
  }

  dimension: transaction_id {
    label: "Transaction ID"
    type: number
    sql: ${TABLE}.transaction_id ;;
  }

  measure: countd_transaction_id {
    label: "# of Orders"
    type: count_distinct
    value_format_name: decimal_0
    sql: ${transaction_id} ;;
    drill_fields: [customer_id, dim_customer.full_name, dim_customer.email, first_order_date_date]
  }

  measure: runningtotal_orders {
    label: "Running Total Orders"
    type: running_total
    value_format_name: decimal_0
    sql: ${countd_transaction_id} ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.Customer_id ;;
  }

  measure: countd_customer_id {
    label: "Unique Customers"
    type: count_distinct
    value_format_name: decimal_0
    sql: ${customer_id} ;;
  }


  # measure: count_customer_id {
  #   label: "Customers"
  #   type: sum
  #   value_format_name: decimal_0
  #   sql: ${customer_id} ;;
  # }

  measure: aov_sales_per_order{
    label: "AOV - Sales per Order"
    type: number
    value_format_name: usd
    sql: ${sum_total_sales} / ${countd_transaction_id} ;;
  }

  measure: ltv_sales_per_customer{
    label: "LTV - Sales per Customer"
    type: number
    value_format_name: usd
    sql: ${sum_total_sales} / ${countd_customer_id} ;;
  }

  measure: aof_orders_per_customer{
    label: "Frequency - Orders per Customer"
    type: number
    value_format: "0.00"
    sql: 1.0 * ${countd_transaction_id} / ${countd_customer_id} ;;
  }

  dimension: customer_type_id {
    type: number
    value_format_name: id
    sql: ${TABLE}.customer_type_id ;;
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

  dimension: item_id {
    label: "Item ID"
    type: number
    sql: ${TABLE}.item_id ;;
  }

  dimension: location_id {
    type: number
    sql: ${TABLE}.Location_id ;;
  }

  dimension: margin_dollars {
    type: string
    sql: ${TABLE}.Margin_Dollars ;;
  }

  dimension: in_this_month_and_year {
    type:  yesno
    label: "In This Month and Year"
    sql: DATEADD(MONTH, DATEDIFF(MONTH, 0, ${ordered_date}), 0) = DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()), 0);;
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

  dimension: subsidiary_id {
    type: number
    sql: ${TABLE}.subsidiary_id ;;
  }

  dimension: marketing_channel_id {
    type: number
    sql: ${TABLE}.marketing_channelid ;;
  }

  dimension_group: first_order_date {
    label: "Customer First Order"
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
    sql: ${TABLE}.first_order_date ;;
  }

  set: fact_sales_detail_drill_set {
    fields: [customer_id,first_order_date_date,dim_brand.first_order_date_date]
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
