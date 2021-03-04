view: dim_estimated_budget {
  sql_table_name: google_sheets.estimatedbudget ;;

  dimension: _fivetran_synced {
    type: string
    sql: ${TABLE}._fivetran_synced ;;
  }

  dimension: _row {
    type: number
    sql: ${TABLE}._row ;;
  }

  dimension: brand_id {
    type: number
    sql: ${TABLE}.brand_id ;;
  }

  dimension: brand_parent_name {
    label: "Brand"
    type: string
    sql: ${TABLE}.brand_parent_name ;;
  }

  dimension: subsidiary_name {
    label: "Subsidiary"
    type: string
    sql: ${TABLE}.subsidiary_name ;;
  }

  dimension_group: date {
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
    sql: ${TABLE}.date ;;
  }

  dimension: estimated_revenue {
    hidden: yes
    type: number
    sql: ${TABLE}.estimated_revenue ;;
  }

  dimension: subsidiary_id {
    type: number
    sql: ${TABLE}.subsidiary_id ;;
  }

  dimension: variable_ad_expense_budget {
    hidden: yes
    type: number
    sql: ${TABLE}.variable_ad_expense_budget ;;
  }

  measure: total_estimated_revenue {
    label: "Estimated Revenue"
    type: sum
    sql: ${estimated_revenue} ;;
  }

  measure: avg_estimated_revenue {
    label: "Average Estimated Revenue"
    type: average
    sql: ${estimated_revenue} ;;
  }

  measure: total_variable_ad_expense_budget {
    label: "Variable Ad Expense Budget"
    type: sum
    sql: ${variable_ad_expense_budget} ;;
  }

  measure: avg_variable_ad_expense_budget {
    label: "Average Variable Ad Expense Budget"
    type: average
    sql: ${variable_ad_expense_budget} ;;
  }

  measure: count {
    type: count
    drill_fields: [subsidiary_name, brand_parent_name]
  }
}
