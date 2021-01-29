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

  measure: runningtotal_total_sales {
    label: "Running Total Sales"
    type: running_total
    value_format_name: usd
    sql: ${total_sales} ;;
  }

  measure: sum_total_sales_2014 {
    label: "Sales in 2014"
    type: sum
    value_format_name: usd
    sql: ${total_sales} ;;
    filters: [ordered_year: "2014"]
  }

  measure: sum_total_sales_2015 {
    label: "Sales in 2015"
    type: sum
    value_format_name: usd
    sql: ${total_sales} ;;
    filters: [ordered_year: "2015"]
  }

  measure: sum_total_sales_2016 {
    label: "Sales in 2016"
    type: sum
    value_format_name: usd
    sql: ${total_sales} ;;
    filters: [ordered_year: "2016"]
  }

  measure: sum_total_sales_2017 {
    label: "Sales in 2017"
    type: sum
    value_format_name: usd
    sql: ${total_sales} ;;
    filters: [ordered_year: "2017"]
  }

  measure: sum_total_sales_2018 {
    label: "Sales in 2018"
    type: sum
    value_format_name: usd
    sql: ${total_sales} ;;
    filters: [ordered_year: "2018"]
  }

  measure: sum_total_sales_2019 {
    label: "Sales in 2019"
    type: sum
    value_format_name: usd
    sql: ${total_sales} ;;
    filters: [ordered_year: "2019"]
  }

  measure: sum_total_sales_2020 {
    label: "Sales in 2020"
    type: sum
    value_format_name: usd
    sql: ${total_sales} ;;
    filters: [ordered_year: "2020"]
  }

  measure: sum_total_sales_2021 {
    label: "Sales in 2021"
    type: sum
    value_format_name: usd
    sql: ${total_sales} ;;
    filters: [ordered_year: "2021"]
  }

  measure: sum_total_sales_2022 {
    label: "Sales in 2022"
    type: sum
    value_format_name: usd
    sql: ${total_sales} ;;
    filters: [ordered_year: "2022"]
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

  measure: sum_item_qty_2014 {
    label: "Item Quantity in 2014"
    type: sum
    value_format_name: decimal_0
    sql: ${item_qty} ;;
    filters: [ordered_year: "2014"]
  }

  measure: sum_item_qty_2015 {
    label: "Item Quantity in 2015"
    type: sum
    value_format_name: decimal_0
    sql: ${item_qty};;
    filters: [ordered_year: "2015"]
  }

  measure: sum_item_qty_2016 {
    label: "Item Quantity in 2016"
    type: sum
    value_format_name: decimal_0
    sql: ${item_qty} ;;
    filters: [ordered_year: "2016"]
  }

  measure: sum_item_qty_2017 {
    label: "Item Quantity in 2017"
    type: sum
    value_format_name: decimal_0
    sql: ${item_qty} ;;
    filters: [ordered_year: "2017"]
  }

  measure: sum_item_qty_2018 {
    label: "Item Quantity in 2018"
    type: sum
    value_format_name: decimal_0
    sql: ${item_qty} ;;
    filters: [ordered_year: "2018"]
  }

  measure: sum_item_qty_2019 {
    label: "Item Quantity in 2019"
    type: sum
    value_format_name: decimal_0
    sql: ${item_qty};;
    filters: [ordered_year: "2019"]
  }

  measure: sum_item_qty_2020 {
    label: "Item Quantity in 2020"
    type: sum
    value_format_name: decimal_0
    sql: ${item_qty} ;;
    filters: [ordered_year: "2020"]
  }

  measure: sum_item_qty_2021 {
    label: "Item Quantity in 2021"
    type: sum
    value_format_name: decimal_0
    sql: ${item_qty} ;;
    filters: [ordered_year: "2021"]
  }

  measure: sum_item_qty_2022 {
    label: "Item Quantity in 2022"
    type: sum
    value_format_name: decimal_0
    sql: ${item_qty} ;;
    filters: [ordered_year: "2022"]
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
  }

  measure: countd_transaction_id_2014 {
    label: "# of Orders in 2014"
    type: count_distinct
    value_format_name: decimal_0
    sql: ${transaction_id};;
    filters: [ordered_year: "2014"]
  }

  measure: countd_transaction_id_2015 {
    label: "# of Orders in 2015"
    type: count_distinct
    value_format_name: decimal_0
    sql: ${transaction_id};;
    filters: [ordered_year: "2015"]
  }

  measure: countd_transaction_id_2016 {
    label: "# of Orders in 2016"
    type: count_distinct
    value_format_name: decimal_0
    sql: ${transaction_id};;
    filters: [ordered_year: "2016"]
  }

  measure: countd_transaction_id_2017 {
    label: "# of Orders in 2017"
    type: count_distinct
    value_format_name: decimal_0
    sql: ${transaction_id};;
    filters: [ordered_year: "2017"]
  }

  measure: countd_transaction_id_2018 {
    label: "# of Orders in 2018"
    type: count_distinct
    value_format_name: decimal_0
    sql: ${transaction_id};;
    filters: [ordered_year: "2018"]
  }

  measure: countd_transaction_id_2019 {
    label: "# of Orders in 2019"
    type: count_distinct
    value_format_name: decimal_0
    sql: ${transaction_id};;
    filters: [ordered_year: "2019"]
  }

  measure: countd_transaction_id_2020 {
    label: "# of Orders in 2020"
    type: count_distinct
    value_format_name: decimal_0
    sql: ${transaction_id};;
    filters: [ordered_year: "2020"]
  }

  measure: countd_transaction_id_2021 {
    label: "# of Orders in 2021"
    type: count_distinct
    value_format_name: decimal_0
    sql: ${transaction_id};;
    filters: [ordered_year: "2021"]
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

  measure: countd_customer_id_2014 {
    label: "# of Customers in 2014"
    type: count_distinct
    value_format_name: decimal_0
    sql: ${customer_id};;
    filters: [ordered_year: "2014"]
  }

  measure: countd_customer_id_2015 {
    label: "# of Customers in 2015"
    type: count_distinct
    value_format_name: decimal_0
    sql: ${customer_id};;
    filters: [ordered_year: "2015"]
  }

  measure: countd_customer_id_2016 {
    label: "# of Customers in 2016"
    type: count_distinct
    value_format_name: decimal_0
    sql: ${customer_id};;
    filters: [ordered_year: "2016"]
  }

  measure: countd_customer_id_2017 {
    label: "# of Customers in 2017"
    type: count_distinct
    value_format_name: decimal_0
    sql: ${customer_id};;
    filters: [ordered_year: "2017"]
  }

  measure: countd_customer_id_2018 {
    label: "# of Customers in 2018"
    type: count_distinct
    value_format_name: decimal_0
    sql: ${customer_id};;
    filters: [ordered_year: "2018"]
  }

  measure: countd_customer_id_2019 {
    label: "# of Customers in 2019"
    type: count_distinct
    value_format_name: decimal_0
    sql: ${customer_id};;
    filters: [ordered_year: "2019"]
  }

  measure: countd_customer_id_2020 {
    label: "# of Customers in 2020"
    type: count_distinct
    value_format_name: decimal_0
    sql: ${customer_id};;
    filters: [ordered_year: "2020"]
  }

  measure: countd_customer_id_2021 {
    label: "# of Customers in 2021"
    type: count_distinct
    value_format_name: decimal_0
    sql: ${customer_id};;
    filters: [ordered_year: "2021"]
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
    value_format: "#.00;(#.00)"
    sql: ${countd_transaction_id} / ${countd_customer_id} ;;
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

  dimension: 2016to2018cohort {
    type:  yesno
    label: "In 2016 to 2018"
    sql: YEAR(${ordered_date}) IN (YEAR('2018-01-01'), YEAR('2017-01-01'), YEAR('2016-01-01'));;
  }

  dimension: 2017to2019cohort {
    type:  yesno
    label: "In 2017 to 2019"
    sql: YEAR(${ordered_date}) IN (YEAR('2019-01-01'), YEAR('2018-01-01'), YEAR('2017-01-01'));;
  }

  dimension: 2018to2020cohort {
    type:  yesno
    label: "In 2018 to 2020"
    sql: YEAR(${ordered_date}) IN (YEAR('2020-01-01'), YEAR('2019-01-01'), YEAR('2018-01-01'));;
  }

  dimension: 2019to2021cohort {
    type:  yesno
    label: "In 2019 to 2021"
    sql: YEAR(${ordered_date}) IN (YEAR('2021-01-01'), YEAR('2020-01-01'), YEAR('2019-01-01'));;
  }

  dimension: cohorts {
    type:  string
    label: "Cohorts"
    sql: CASE
          WHEN  YEAR(${ordered_date}) IN (YEAR('2012'), YEAR('2013'), YEAR('2014')) THEN '2012 to 2014'
          WHEN  YEAR(${ordered_date}) IN (YEAR('2013'), YEAR('2014'), YEAR('2015')) THEN '2013 to 2015'
          WHEN  YEAR(${ordered_date}) IN (YEAR('2014'), YEAR('2015'), YEAR('2016')) THEN '2014 to 2016'
          WHEN  YEAR(${ordered_date}) IN (YEAR('2015'), YEAR('2016'), YEAR('2017')) THEN '2015 to 2017'
          WHEN  YEAR(${ordered_date}) IN (YEAR('2016'), YEAR('2017'), YEAR('2018')) THEN '2016 to 2018'
          WHEN  YEAR(${ordered_date}) IN (YEAR('2017'), YEAR('2018'), YEAR('2019')) THEN '2017 to 2019'
          WHEN  YEAR(${ordered_date}) IN (YEAR('2018'), YEAR('2019'), YEAR('2020')) THEN '2018 to 2020'
          WHEN  YEAR(${ordered_date}) IN (YEAR('2019'), YEAR('2020'), YEAR('2021')) THEN '2019 to 2021'
          WHEN  YEAR(${ordered_date}) IN (YEAR('2020'), YEAR('2021'), YEAR('2022')) THEN '2020 to 2022'
          END;;
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
