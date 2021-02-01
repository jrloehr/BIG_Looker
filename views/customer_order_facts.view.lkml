view: customer_order_facts {
  derived_table: {
    sql: SELECT
        fact_sales_detail.Customer_id  AS customer_id,
        COALESCE(SUM(fact_sales_detail.Total_Sales_B4_Returns ), 0) AS lifetime_sales,
        COUNT(DISTINCT fact_sales_detail.etail_order_id)  AS lifetime_orders,
        CAST(MIN(fact_sales_detail.OrderedDate)  AS DATE) AS first_order,
        CAST(MAX(fact_sales_detail.OrderedDate)  AS DATE)  AS latest_order,
        COUNT(DISTINCT MONTH(fact_sales_detail.OrderedDate))  AS number_of_distinct_months_with_orders
      FROM dbo.FactSalesDetail  AS fact_sales_detail

      GROUP BY fact_sales_detail.Customer_id
       ;;
  }

  measure: count {
    type: count
    drill_fields: [customer*]
  }

  dimension: customer_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: first_order {
    type: date
    sql: ${TABLE}.first_order ;;
  }

  dimension: latest_order {
    type: date
    sql: ${TABLE}.latest_order ;;
  }

  dimension: number_of_distinct_months_with_orders {
    type: number
    sql: ${TABLE}.number_of_distinct_months_with_orders ;;
  }

##### Time and Cohort Fields ######

  dimension_group: first_order {
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.first_order ;;
  }

  dimension_group: latest_order {
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.latest_order ;;
  }

  dimension: days_as_customer {
    description: "Days between first and latest order"
    type: number
    sql: DATEDIFF(DAY,${first_order_date},${latest_order_date}) ;;
    drill_fields: [customer*]
  }

  dimension: days_as_customer_tiered {
    type: tier
    tiers: [0, 1, 14, 30, 60, 90, 120]
    sql: ${days_as_customer} ;;
    style: integer
  }

  dimension: months_as_customer {
    description: "Days between first and latest order"
    type: number
    sql: DATEDIFF(MONTH,${first_order_date},${latest_order_date}) ;;
    drill_fields: [customer*]
  }

  dimension: months_as_customer_tiered {
    type: tier
    tiers: [0, 6, 13, 19, 37]
    sql: ${months_as_customer} ;;
    style: integer
  }

  ##### Lifetime Behavior - Order Counts ######

  dimension: lifetime_orders {
    type: number
    sql: ${TABLE}.lifetime_orders ;;
  }

  dimension: repeat_customer {
    description: "Lifetime Count of Orders > 1"
    type: yesno
    sql: ${lifetime_orders} > 1 ;;
  }

  dimension: lifetime_orders_tier {
    type: tier
    tiers: [0, 1, 2, 3, 5, 10]
    sql: ${lifetime_orders} ;;
    style: integer
  }

  measure: average_lifetime_orders {
    type: average
    value_format_name: decimal_2
    sql: ${lifetime_orders} ;;
  }

  dimension: distinct_months_with_orders {
    type: number
    sql: ${TABLE}.number_of_distinct_months_with_orders ;;
  }

  ##### Lifetime Behavior - Revenue ######

  dimension: lifetime_sales {
    type: number
    sql: ${TABLE}.lifetime_sales ;;
  }

  dimension: lifetime_revenue_tier {
    type: tier
    tiers: [0, 25, 50, 100, 200, 500, 1000]
    sql: ${lifetime_sales} ;;
    style: integer
  }

  measure: average_lifetime_revenue {
    type: average
    value_format_name: usd
    sql: ${lifetime_sales} ;;
  }

  set: customer {
    fields: [
      customer_id,
      dim_customer.full_name,
      lifetime_sales,
      lifetime_orders,
      first_order,
      latest_order,
      number_of_distinct_months_with_orders
    ]
  }
}
