view: new_customer_12_month_averages {
  derived_table: {sql: DROP TABLE IF EXISTS #TempNewOrderSums

  SELECT fma.brand_parent_id
  , fma.brand_parent_name
  , SUM(fma.new_order_count) as New_Order_Sum
  , DATEADD(MONTH, DATEDIFF(MONTH, 0, fma.[date]), 0) as MonthandYear

  INTO #TempNewOrderSums
  FROM edw.tblFactMarketingActivty_Campaign as fma

  GROUP BY
  fma.brand_parent_id
  , fma.brand_parent_name
  , fma.brand_parent_name
  , DATEADD(MONTH, DATEDIFF(MONTH, 0, fma.[date]), 0)

  SELECT *
  , AVG(tno.New_Order_Sum) OVER (ORDER BY tno.Brand_Parent_ID, tno.MonthandYear ROWS BETWEEN 11 PRECEDING AND CURRENT ROW) as MovingMonthlyAverage
  FROM #TempNewOrderSums as tno ;;

  }

  dimension: brand_parent_id {
    label: "Brand Parent ID"
    type: number
    sql: ${TABLE}.brand_parent_id ;;
  }

  dimension: brand_parent_name {
    label: "Brand Parent Name"
    type: string
    sql: ${TABLE}.brand_parent_name ;;
  }

  measure: new_order_sum {
    label: "New Customer Orders Sum"
    type: sum
    sql: ${TABLE}.new_order_sum ;;
  }

  dimension_group: ordered {
    group_label: "Ordered Date"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year,
      month_name,
      month_num
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.MonthandYear ;;
    description: "Use this field to check the order date. Select the time-frame you'd like to use."
  }

  dimension: twelve_month_average {
    label: "12 Month Average"
    type: number
    sql: ${TABLE}.movingmonthlyaverage ;;
  }

  # # You can specify the table name if it's different from the view name:
  # sql_table_name: my_schema_name.tester ;;
  #
  # # Define your dimensions and measures here, like this:
  # dimension: user_id {
  #   description: "Unique ID for each user that has ordered"
  #   type: number
  #   sql: ${TABLE}.user_id ;;
  # }
  #
  # dimension: lifetime_orders {
  #   description: "The total number of orders for each user"
  #   type: number
  #   sql: ${TABLE}.lifetime_orders ;;
  # }
  #
  # dimension_group: most_recent_purchase {
  #   description: "The date when each user last ordered"
  #   type: time
  #   timeframes: [date, week, month, year]
  #   sql: ${TABLE}.most_recent_purchase_at ;;
  # }
  #
  # measure: total_lifetime_orders {
  #   description: "Use this for counting lifetime orders across many users"
  #   type: sum
  #   sql: ${lifetime_orders} ;;
  # }
}

# view: new_customer_12_month_averages {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
