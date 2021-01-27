view: product_category_rollup {
  derived_table: {
    sql:
    SELECT
        dim_item.ProductCategory  AS "dim_item.product_category",
        CONVERT(VARCHAR(10),fact_sales_detail.OrderedDate ,120) AS "fact_sales_detail.ordered_date",
        COALESCE(SUM(fact_sales_detail.Gross_Sales), 0) AS "fact_sales_detail.sum_gross_sales",
        COUNT(DISTINCT fact_sales_detail.transaction_id ) AS "fact_sales_detail.countd_transaction_id"
      FROM dbo.FactSalesDetail  AS fact_sales_detail
      LEFT JOIN dbo.DimItem  AS dim_item ON fact_sales_detail.item_id = dim_item.item_id

      GROUP BY dim_item.ProductCategory ,CONVERT(VARCHAR(10),fact_sales_detail.OrderedDate ,120)
       ;;
  }

  dimension: compound_primary_key {
    primary_key: yes
    hidden: no
    type: string
    sql: CONCAT(${product_category}, ${ordered_date}) ;;
  }

  dimension: product_category {
    # primary_key: yes
    type: string
    sql: ${TABLE}."dim_item.product_category" ;;
  }

  dimension_group: ordered {
    type: time
    timeframes: [date, month, quarter, year]
    sql: ${TABLE}."fact_sales_detail.ordered_date" ;;
  }

  dimension: sum_gross_sales {
    hidden: yes
    type: string
    sql: ${TABLE}."fact_sales_detail.sum_gross_sales" ;;
  }

  dimension: countd_transaction_id {
    hidden: yes
    type: number
    sql: ${TABLE}."fact_sales_detail.countd_transaction_id" ;;
  }

  measure: total_category_gross_sales {
    type: sum_distinct
    sql: ${sum_gross_sales} ;;
    value_format_name: usd_0
    sql_distinct_key: ${compound_primary_key} ;;
  }


  measure: total_category_transactions {
    type: sum_distinct
    sql: ${countd_transaction_id} ;;
    value_format_name: usd_0
    sql_distinct_key: ${compound_primary_key} ;;
    drill_fields: [detail*]
  }


  set: detail {
    fields: [product_category, ordered_date]
  }
}
