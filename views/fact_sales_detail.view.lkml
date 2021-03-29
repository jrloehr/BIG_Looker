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
    description: "Use this to get the aggregated cost of goods sold."
    hidden: yes
  }

  measure: cogs_per_order {
    label: "Average COGS"
    type: number
    value_format_name: usd
    sql: 1.0 * ${cogs_total} / ${countd_transaction_id} ;;
    description: "Cost of Goods Sold / Orders - produces average COGS."
    hidden: yes
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
    description: "Use this field to get the aggregated shipping cost."
    hidden: yes
  }

  measure: runningtotal_total_shipping {
    group_label: "Shipping"
    label: "Running Total Shipping"
    type: running_total
    value_format_name: usd
    sql: ${sum_shipping} ;;
    description: "Use this field to get the running total shipping costs of a period."
    hidden: yes
  }

  measure: avg_shipping {
    group_label: "Shipping"
    label: "Average Shipping"
    type: number
    value_format_name: usd
    sql: 1.0 * ${sum_shipping} / ${countd_transaction_id} ;;
    description: "Total Shipping / Orders - produces average shipping cost."
  }

  dimension: net_sales {
    group_label: "Net Sales"
    hidden: yes
    label: "Net Sales"
    description: "Net Sales = Gross Sales - Discounts"
    type: string
    value_format_name: usd
    sql: ${TABLE}.Net_Sales_B4_Returns ;;
  }

  measure: sum_net_sales {
    group_label: "Net Sales"
    label: "Total Net Sales"
    description: "Net Sales = Gross Sales - Discounts + Shipping"
    type: sum
    value_format_name: usd
    sql: ${net_sales} + ${shipping} ;;
  }

  measure: runningtotal_net_sales {
    group_label: "Net Sales"
    label: "Running Total Net Sales"
    description: "Use this to get the running total Net Sales of a period."
    type: running_total
    value_format_name: usd
    sql: ${sum_net_sales} + ${sum_shipping} ;;
  }

  measure: avg_net_sales {
    group_label: "Net Sales"
    label: "Average Net Sales"
    description: "Net Sales / Orders - produces average Net Sales."
    type: number
    value_format_name: usd
    sql: 1.0 * (${sum_net_sales} + ${sum_shipping}) / ${countd_transaction_id} ;;
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
    hidden: yes
    group_label: "Taxes"
    label: "Total Taxes"
    type: sum
    value_format_name: usd
    sql: ${taxes} ;;
    description: "Use this field to get the aggregated Sales Tax."
  }

  measure: runningtotal_total_taxes {
    hidden: yes
    group_label: "Taxes"
    label: "Running Total Taxes"
    type: running_total
    value_format_name: usd
    sql: ${sum_taxes} ;;
    description: "Use this field to get the cumulative Sales Tax for a period."
  }

  measure: avg_taxes {
    hidden: yes
    group_label: "Taxes"
    label: "Average Taxes"
    type: number
    value_format_name: usd
    sql: 1.0 * ${sum_taxes} / ${countd_transaction_id} ;;
    description: "Total Sales Tax / Orders - use this field to get the average sales tax for orders."
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
    hidden: yes
    group_label: "Total Sales"
    label: "Total Sales"
    description: "Sales Amount = Gross Sales - Discounts + Shipping + Taxes"
    type: sum
    value_format_name: usd
    sql: ${total_sales} ;;
  }

  measure: runningtotal_total_sales {
    hidden: yes
    group_label: "Total Sales"
    label: "Running Total Sales"
    description: "Use this field to get the cumulative total sales amount for period."
    type: running_total
    value_format_name: usd
    sql: ${sum_total_sales} ;;
  }

  measure: avg_total_sales {
    hidden: yes
    group_label: "Total Sales"
    label: "Average Total Sales"
    type: number
    value_format_name: usd
    sql: 1.0 * ${sum_total_sales} / ${countd_transaction_id} ;;
    description: "Use this field to get the average total sales (total sales / orders)."
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
    sql: ${net_sales} ;;
    value_format_name: usd
    filters: [sales_year_selected: "1"]
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
    hidden: yes
    group_label: "Item Quantity"
    label: "Total Item Quantity"
    description: "Use this to get the quantity of items in orders."
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}.Item_Qty ;;
  }

  measure: runningtotal_item_qty {
    hidden: yes
    group_label: "Item Quantity"
    label: "Running Total Item Quantity"
    description: "Use this field to get a cumulative of quantity in orders in a period."
    type: running_total
    value_format_name: decimal_0
    sql: ${sum_item_qty} ;;
  }

  measure: avg_item_qty {
    hidden: yes
    group_label: "Item Quantity"
    label: "Average Item Quantity"
    description: "Use this field to get the average number of items in an order (Item Quantity / Orders)"
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
    description: "Gross Sales - the amount of the sale from NetSuite."
  }

  measure: runningtotal_gross_sales {
    hidden: yes
    group_label: "Gross Sales"
    label: "Running Total Gross Sales"
    type: running_total
    value_format_name: usd
    sql: ${sum_gross_sales} ;;
    description: "Use this field to get a cumulative of Gross Sales in a period."
  }

  measure: avg_gross_sales {
    hidden: yes
    group_label: "Gross Sales"
    label: "Average Gross Sales"
    description: "Use this field to get the average Gross Sales (Gross Sales / Orders)"
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
    description: "Use this field to see aggregated discounts."
    type: sum
    value_format_name: usd
    sql: ${discounts};;
  }

  measure: runningtotal_discounts {
    hidden: yes
    group_label: "Discounts"
    label: "Running Total Discounts"
    description: "Use this field to see cumulative discounts in a given period."
    type: running_total
    value_format_name: usd
    sql: ${sum_discounts} ;;
  }

  measure: avg_discounts {
    group_label: "Discounts"
    label: "Average Discounts"
    description: "Use this field to see average discounts (Total Discounts / Orders)"
    type: number
    value_format_name: usd
    sql: 1.0 * ${sum_discounts} / ${countd_transaction_id};;
  }

  dimension: transaction_id {
    group_label: "Orders"
    label: "Transaction ID"
    hidden: yes
    type: number
    sql: ${TABLE}.transaction_id ;;
  }

  measure: countd_transaction_id {
    group_label: "Orders"
    label: "# of Orders"
    description: "Use this field to get the distinct/unique number of orders in a period."
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
    description: "Use this field to get a cumulative number of orders in a period."
  }

  dimension: customer_id {
    hidden: yes
    group_label: "Customers"
    type: number
    sql: ${TABLE}.Customer_id ;;
    description: "This field may be more useful once BIG has a BIG Customer ID field."
  }

  measure: countd_customer_id {
    group_label: "Customers"
    label: "Unique Customers"
    type: count_distinct
    value_format_name: decimal_0
    sql: ${customer_id} ;;
    description: "Use this field to get the unique customers at BIG."
  }


  # measure: count_customer_id {
  #   label: "Customers"
  #   type: sum
  #   value_format_name: decimal_0
  #   sql: ${customer_id} ;;
  # }

  measure: aov_sales_per_order{
    label: "AOV - Sales per Order"
    description: "Use this to see the average order value. Can be useful when comparing timeframes, brands, etc. Net Sales / # of Orders"
    type: number
    value_format_name: usd
    sql: 1.0 * ${sum_net_sales} / ${countd_transaction_id} ;;
  }

  measure: ltv_sales_per_customer{
    hidden: yes
    label: "LTV - Sales per Customer"
    description: "Use this field to get the lifetime value (Net Sales / Unique Customers) for a group of customers. Can be useful when comparing customer types/cohorts."
    type: number
    value_format_name: usd
    sql: 1.0 * ${sum_net_sales} / ${countd_customer_id} ;;
  }

  measure: aof_orders_per_customer{
    hidden: yes
    label: "Frequency - Orders per Customer"
    description: "Use this field to determine order frequency. Can be useful when determining customer loyalty in customer types (# of Orders / Unique Customers)"
    type: number
    value_format_name: decimal_0
    sql: 1.0 * ${countd_transaction_id} / ${countd_customer_id} ;;
  }

  dimension: customer_type_id {
    hidden: yes
    label: "Sales Channel"
    description: "The NetSuite Customer Type field, includes types of customers for BIG and their subsidiaries."
    type: number
    value_format_name: id
    sql: ${TABLE}.customer_type_id ;;
  }

  dimension: document_number {
    hidden: yes
    description: "I don't know what this field is or if it's useful."
    type: string
    sql: ${TABLE}.Document_Number ;;
  }

  dimension: etail_order_id {
    label: "eTail Order ID"
    description: "Etail Order ID is a unique tag given in Shopify. Currently, only Shopify provides an etail order ID, so when the etail order ID is present, it means the order is a 'Shopify' order."
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
    hidden: yes
    description: "Unique count of all eTail Order IDs in a subset of data."
    type: count_distinct
    sql: ${etail_order_id};;
  }

  dimension: item_id {
    hidden: yes
    label: "Item ID"
    type: number
    sql: ${TABLE}.item_id ;;
  }

  dimension: location_id {
    hidden: yes
    description: "This is the Brand_Parent_ID, related to Brand Parent Name."
    type: number
    sql: ${TABLE}.Location_id ;;
  }

  dimension: margin_dollars {
    hidden: yes
    type: string
    sql: ${TABLE}.Margin_Dollars ;;
  }

# MAY NEED TO CHANGE THESE TO FILTERS
  dimension: year_to_date {
    group_label: "Date Filters"
    type:  yesno
    label: "Year to Date"
    sql: ${ordered_date} <= GETDATE() - 1
      AND YEAR(${ordered_date}) = YEAR(GETDATE());;
  }

# MAY NEED TO CHANGE THESE TO FILTERS
  dimension: month_to_date {
    group_label: "Date Filters"
    type:  yesno
    label: "Month to Date"
    sql: ${ordered_date} <= GETDATE() - 1
      AND YEAR(${ordered_date}) = YEAR(GETDATE())
      AND MONTH(${ordered_date}) = MONTH(GETDATE());;
  }

# MAY NEED TO CHANGE THESE TO FILTERS
  dimension: last_seven_days {
    group_label: "Date Filters"
    type:  yesno
    label: "Last Seven Days"
    sql: ${ordered_date} <= GETDATE() - 1
      AND ${ordered_date} >= GETDATE() - 8;;
  }

  dimension: order_date_last_year {
    group_label: "Date Filters"
    type:  yesno
    label: "Last Year"
    sql: ${ordered_date} <= GETDATE() - 1
      AND YEAR(${ordered_date}) = YEAR(GETDATE()) - 1;;
  }

  dimension: order_date_last_year_month_to_date {
    group_label: "Date Filters"
    type:  yesno
    label: "Last Year Month to Date"
    sql: ${ordered_date} <= GETDATE() - 1
      AND YEAR(${ordered_date}) = YEAR(GETDATE()) - 1
      AND MONTH(${ordered_date}) = MONTH(GETDATE())
      AND DAY(${ordered_date}) <= DAY(GETDATE()) - 1;;
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
    description: "Use this field to check the order date. Select the time-frame you'd like to use."
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
    hidden: yes
    description: "Use this field to group/filter/compare by Ship Date. Select the time-frame you'd like to use."
  }

  dimension: shipped_flag {
    description: "Presumably, this is a flag that will tell whether or not an order has shipped. Could be used to help confirm/validate data in NetSuite."
    type: number
    sql: ${TABLE}.ShippedFlag ;;
  }

  dimension: subsidiary_id {
    hidden: yes
    type: number
    sql: ${TABLE}.subsidiary_id ;;
  }

  dimension: marketing_channel_id {
    hidden: yes
    type: number
    sql: ${TABLE}.marketing_channelid ;;
  }

  set: fact_sales_detail_drill_set {
    fields: [customer_id,dim_brand.first_order_date_date]
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }
}
