view: fact_sales_detail {
  sql_table_name: dbo.FactSalesDetail ;;

  dimension: cogs {
    label: "Cost of Goods Sold"
    hidden: yes
    type: string
    sql: ${TABLE}.COGS ;;
  }

  measure: cogs_total {
    label: "Cost of Goods Sold"
    type: sum
    value_format_name: usd
    sql: ${TABLE}.COGS ;;
  }

  measure: cogs_per_order {
    label: "Average COGS"
    type: number
    value_format_name: usd
    sql: ${cogs_total} / ${countd_transaction_id} ;;
  }

  dimension: net_sales_b4_returns {
    group_label: "Net Sales"
    hidden: yes
    label: "Net Sales"
    description: "Net Sales = Gross Sales - Discounts"
    type: string
    value_format_name: usd
    sql: ${TABLE}.Net_Sales_B4_Returns ;;
  }

  measure: sum_net_sales_b4_returns {
    group_label: "Net Sales"
    label: "Total Net Sales"
    description: "Net Sales = Gross Sales - Discounts"
    type: sum
    value_format_name: usd
    sql: ${net_sales_b4_returns} ;;
  }

  measure: runningtotal_net_sales_b4_returns {
    group_label: "Net Sales"
    label: "Running Total Net Sales"
    description: "Net Sales = Gross Sales - Discounts"
    type: running_total
    value_format_name: usd
    sql: ${sum_net_sales_b4_returns} ;;
  }

  measure: shp_avg_net_sales_b4_returns {
    group_label: "Net Sales"
    label: "Average Net Sales"
    description: "Net Sales = Gross Sales - Discounts"
    type: number
    value_format_name: usd
    sql: 1.0 * ${sum_net_sales_b4_returns} / ${countd_transaction_id} ;;
  }

  dimension: shipping {
    group_label: "Shipping"
    hidden: yes
    label: "Shipping"
    type: number
    value_format_name: usd
    sql: ${TABLE}.Shipping ;;
  }

  measure: sum_shipping {
    group_label: "Shipping"
    label: "Total Shipping"
    type: sum
    value_format_name: usd
    sql: ${shipping} ;;
  }

  measure: runningtotal_total_shipping {
    group_label: "Shipping"
    label: "Running Total Shipping"
    type: running_total
    value_format_name: usd
    sql: ${sum_shipping} ;;
  }

  measure: shp_avg_shipping {
    group_label: "Shipping"
    label: "Average Shipping"
    type: number
    value_format_name: usd
    sql: 1.0 * ${sum_shipping} / ${countd_transaction_id} ;;
  }

  dimension: taxes {
    group_label: "Taxes"
    hidden: yes
    label: "Taxes"
    type: number
    value_format_name: usd
    sql: ${TABLE}.Taxes ;;
  }

  measure: sum_taxes {
    group_label: "Taxes"
    label: "Total Taxes"
    type: sum
    value_format_name: usd
    sql: ${taxes} ;;
  }

  measure: runningtotal_total_taxes {
    group_label: "Taxes"
    label: "Running Total Taxes"
    type: running_total
    value_format_name: usd
    sql: ${sum_taxes} ;;
  }

  measure: shp_avg_taxes {
    group_label: "Taxes"
    label: "Average Taxes"
    type: number
    value_format_name: usd
    sql: 1.0 * ${sum_taxes} / ${countd_transaction_id} ;;
  }

  dimension: total_sales {
    group_label: "Total Sales"
    hidden: yes
    label: "Sales Amount"
    description: "Sales Amount = Gross Sales - Discounts + Shipping + Taxes"
    type: number
    value_format_name: usd
    sql: ${TABLE}.Total_Sales_B4_Returns ;;
  }

  measure: sum_total_sales {
    group_label: "Total Sales"
    label: "Total Sales"
    description: "Sales Amount = Gross Sales - Discounts + Shipping + Taxes"
    type: sum
    value_format_name: usd
    sql: ${total_sales} ;;
  }

  measure: sum_total_sales_last_year {
    group_label: "Total Sales"
    label: "Total Sales Last Year"
    description: "Sales Amount = Gross Sales - Discounts + Shipping + Taxes"
    type: sum
    value_format_name: usd
    sql: ${total_sales};;
    filters: [order_date_last_year: "yes"]
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
    group_label: "Total Sales"
    label: "Filtered Sales"
    description: "Sales Amount = Gross Sales - Discounts + Shipping + Taxes"
    type: sum
    sql: ${total_sales} ;;
    value_format_name: usd
    filters: [sales_year_selected: "1"]
  }

  measure: runningtotal_total_sales {
    group_label: "Total Sales"
    label: "Running Total Sales"
    description: "Sales Amount = Gross Sales - Discounts + Shipping + Taxes"
    type: running_total
    value_format_name: usd
    sql: ${sum_total_sales} ;;
  }

  measure: shp_avg_total_sales {
    group_label: "Total Sales"
    label: "Average Total Sales"
    description: "Sales Amount = Gross Sales - Discounts + Shipping + Taxes"
    type: number
    value_format_name: usd
    sql: 1.0 * ${sum_total_sales} / ${countd_transaction_id} ;;
  }

  dimension: item_qty {
    group_label: "Item Quantity"
    hidden: yes
    label: "Item Quantity"
    type: number
    value_format_name: decimal_0
    sql: ${TABLE}.Item_Qty ;;
  }

  measure: sum_item_qty {
    group_label: "Item Quantity"
    label: "Total Item Quantity"
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}.Item_Qty ;;
  }

  measure: runningtotal_item_qty {
    group_label: "Item Quantity"
    label: "Running Total Item Quantity"
    type: running_total
    value_format_name: decimal_0
    sql: ${sum_item_qty} ;;
  }

  measure: shp_avg_item_qty {
    group_label: "Item Quantity"
    label: "Average Item Quantity"
    type: number
    value_format_name: decimal_0
    sql: 1.0 * ${sum_item_qty} / ${countd_transaction_id} ;;
  }

  dimension: gross_sales {
    group_label: "Gross Sales"
    hidden: yes
    label: "Gross Sales"
    type: string
    value_format_name: usd
    sql: ${TABLE}.Gross_Sales ;;
  }

  measure: sum_gross_sales {
    group_label: "Gross Sales"
    label: "Total Gross Sales"
    type: sum
    sql: ${gross_sales};;
    value_format_name: usd
    description: "Description of Gross Sales"
  }

  measure: runningtotal_gross_sales {
    group_label: "Gross Sales"
    label: "Running Total Gross Sales"
    type: running_total
    value_format_name: usd
    sql: ${sum_gross_sales} ;;
  }

  measure: shp_avg_gross_sales {
    group_label: "Gross Sales"
    label: "Average Gross Sales"
    type: number
    value_format_name: usd
    sql: 1.0 * ${sum_gross_sales} / ${countd_transaction_id};;
  }

  dimension: discounts {
    group_label: "Discounts"
    hidden: yes
    label: "Discounts"
    type: number
    value_format_name: usd
    sql: ${TABLE}.Discounts ;;
  }

  measure: sum_discounts {
    group_label: "Discounts"
    label: "Total Discounts"
    type: sum
    value_format_name: usd
    sql: ${discounts};;
  }

  measure: runningtotal_discounts {
    group_label: "Discounts"
    label: "Running Total Discounts"
    type: running_total
    value_format_name: usd
    sql: ${sum_discounts} ;;
  }

  measure: shp_avg_discounts {
    group_label: "Discounts"
    label: "Average Discounts"
    type: number
    value_format_name: usd
    sql: 1.0 * ${sum_discounts} / ${countd_transaction_id};;
  }

  dimension: transaction_id {
    group_label: "Orders"
    label: "Transaction ID"
    type: number
    sql: ${TABLE}.transaction_id ;;
  }

  measure: countd_transaction_id {
    group_label: "Orders"
    label: "# of Orders"
    type: count_distinct
    value_format_name: decimal_0
    sql: ${transaction_id} ;;
    drill_fields: [customer_id, dim_customer.full_name, dim_customer.email]
  }

  measure: runningtotal_orders {
    group_label: "Orders"
    label: "Running Total Orders"
    type: running_total
    value_format_name: decimal_0
    sql: ${countd_transaction_id} ;;
  }

  dimension: customer_id {
    group_label: "Customers"
    type: number
    sql: ${TABLE}.Customer_id ;;
  }

  measure: countd_customer_id {
    group_label: "Customers"
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
    description: "Total Sales / # of Orders"
    type: number
    value_format_name: usd
    sql: 1.0 * ${sum_total_sales} / ${countd_transaction_id} ;;
  }

  measure: ltv_sales_per_customer{
    label: "LTV - Sales per Customer"
    description: "Total Sales / Unique Customers"
    type: number
    value_format_name: usd
    sql: 1.0 * ${sum_total_sales} / ${countd_customer_id} ;;
  }

  measure: aof_orders_per_customer{
    label: "Frequency - Orders per Customer"
    description: "# of Orders / Unique Customers"
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

  dimension: ecommerce_etail_order_id_filter {
    label: "etail Order ID Filter"
    description: "This is used to help filter for those items that have Shopify orders."
    type: string
    sql: CASE
          WHEN ${etail_order_id} IS NULL THEN 'No etail Order ID'
          WHEN ${etail_order_id} IS NOT NULL THEN 'Has Etail Order ID'
          END;;
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

# MAY NEED TO CHANGE THESE TO FILTERS
  dimension: year_to_date {
    group_label: "Date Filters"
    type:  yesno
    label: "Year to Date"
    sql: ${ordered_date} <= GETDATE()
    AND YEAR(${ordered_date}) = YEAR(GETDATE());;
  }

# MAY NEED TO CHANGE THESE TO FILTERS
  dimension: month_to_date {
    group_label: "Date Filters"
    type:  yesno
    label: "Month to Date"
    sql: ${ordered_date} <= GETDATE()
      AND YEAR(${ordered_date}) = YEAR(GETDATE())
      AND MONTH(${ordered_date}) = MONTH(GETDATE());;
  }

  dimension: order_date_last_year {
    group_label: "Date Filters"
    type:  yesno
    label: "Last Year"
    sql: ${ordered_date} <= GETDATE()
    AND YEAR(${ordered_date}) = YEAR(GETDATE()) - 1;;
  }

  dimension: order_date_last_year_month_to_date {
    group_label: "Date Filters"
    type:  yesno
    label: "Last Year Month to Date"
    sql: ${ordered_date} <= GETDATE()
      AND YEAR(${ordered_date}) = YEAR(GETDATE()) - 1
      AND MONTH(${ordered_date}) = MONTH(GETDATE());;
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

  set: fact_sales_detail_drill_set {
    fields: [customer_id,dim_brand.first_order_date_date]
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
