view: cohort_tool {
  derived_table: {
    sql: SELECT year(ordereddate) as year,sum(gross_sales) as total_sales,count(distinct transaction_id) as count_transactions,count(distinct customer_id) as count_customers,'2012 to 2014' as cohort
        FROM dbo.FactSalesDetail
        WHERE year(ordereddate) IN (2012, 2013, 2014)
        GROUP BY year(ordereddate)
      UNION ALL
      SELECT year(ordereddate) as year,sum(gross_sales) as total_sales,count(distinct transaction_id) as count_transactions,count(distinct customer_id) as count_customers,'2013 to 2015' as cohort
        FROM dbo.FactSalesDetail
        WHERE year(ordereddate) IN (2013, 2014, 2015)
        GROUP BY year(ordereddate)
        UNION ALL
      SELECT year(ordereddate) as year,sum(gross_sales) as total_sales,count(distinct transaction_id) as count_transactions,count(distinct customer_id) as count_customers,'2014 to 2016' as cohort
        FROM dbo.FactSalesDetail
        WHERE year(ordereddate) IN (2014, 2015, 2016)
        GROUP BY year(ordereddate)
      UNION ALL
      SELECT year(ordereddate) as year,sum(gross_sales) as total_sales,count(distinct transaction_id) as count_transactions,count(distinct customer_id) as count_customers,'2015 to 2017' as cohort
        FROM dbo.FactSalesDetail
        WHERE year(ordereddate) IN (2015, 2016, 2017)
        GROUP BY year(ordereddate)
      UNION ALL
      SELECT year(ordereddate) as year,sum(gross_sales) as total_sales,count(distinct transaction_id) as count_transactions,count(distinct customer_id) as count_customers,'2016 to 2018' as cohort
        FROM dbo.FactSalesDetail
        WHERE year(ordereddate) IN (2016, 2017, 2018)
        GROUP BY year(ordereddate)
      UNION ALL
      SELECT year(ordereddate) as year,sum(gross_sales) as total_sales,count(distinct transaction_id) as count_transactions,count(distinct customer_id) as count_customers,'2017 to 2019' as cohort
        FROM dbo.FactSalesDetail
        WHERE year(ordereddate) IN (2017, 2018, 2019)
        GROUP BY year(ordereddate)
      UNION ALL
      SELECT year(ordereddate) as year,sum(gross_sales) as total_sales,count(distinct transaction_id) as count_transactions,count(distinct customer_id) as count_customers,'2018 to 2020' as cohort
        FROM dbo.FactSalesDetail
        WHERE year(ordereddate) IN (2018, 2019, 2020)
        GROUP BY year(ordereddate)
        UNION ALL
      SELECT year(ordereddate) as year,sum(gross_sales) as total_sales,count(distinct transaction_id) as count_transactions,count(distinct customer_id) as count_customers,'2019 to 2021' as cohort
        FROM dbo.FactSalesDetail
        WHERE year(ordereddate) IN (2019, 2020, 2021)
        GROUP BY year(ordereddate)
        UNION ALL
      SELECT year(ordereddate) as year,sum(gross_sales) as total_sales, count(distinct transaction_id) as count_transactions, count(distinct customer_id) as count_customers,'2020 to 2022' as cohort
        FROM dbo.FactSalesDetail
        WHERE year(ordereddate) IN (2020, 2021, 2022)
        GROUP BY year(ordereddate)
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: total_sales {
    label: "Total Gross Sales"
    type: sum
    value_format_name: usd_0
    sql: ${sales} ;;
  }

  measure: total_customers {
    label: "Unique Customers"
    type: sum
    sql: ${count_customers} ;;
  }

  measure: total_transactions {
    label: "# of Orders"
    type: sum
    sql: ${count_transactions} ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  dimension: sales {
    hidden: yes
    type: string
    sql: ${TABLE}.total_sales ;;
  }

  dimension: count_transactions {
    type: number
    sql: ${TABLE}.count_transactions ;;
  }

  dimension: count_customers {
    type: number
    sql: ${TABLE}.count_customers ;;
  }

  dimension: cohort {
    type: string
    sql: ${TABLE}.cohort ;;
  }

  set: detail {
    fields: [year, total_sales, count_transactions, count_customers, cohort]
  }
}
