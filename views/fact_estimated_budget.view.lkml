view: fact_estimated_budget {
  sql_table_name: google_sheets.fact_estimated_budget ;;

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
    description: "Use this field to track budgeted ad expense or projected revenue. For projected revenue, this is tied to order date (and associates to Net Sales). For budgeted ad expense, this is tied to the ad date (and associates with marketing spend)."
  }

  dimension: _fivetran_synced {
    hidden: yes
    type: string
    sql: ${TABLE}._fivetran_synced ;;
  }

  dimension: _row {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}._row ;;
  }

  dimension: brand_parent_id {
    hidden: yes
    type: number
    sql: ${TABLE}.brand_parent_id ;;
  }

  dimension: brand_parent_name {
    hidden: yes
    label: "Brand Name"
    type: string
    sql: ${TABLE}.brand_parent_name ;;
  }

  dimension: subsidiary_name {
    hidden: yes
    label: "Subsidiary Name"
    type: string
    sql: ${TABLE}.subsidiary_name ;;
  }

  dimension: estimated_revenue {
    hidden: yes
    type: number
    sql: ${TABLE}.estimated_revenue ;;
    description: "Use this field to track estimated revenue."
  }

  dimension: subsidiary_id {
    hidden: yes
    type: number
    sql: ${TABLE}.subsidiary_id ;;
  }

  dimension: variable_ad_expense_budget {
    hidden: yes
    type: number
    sql: ${TABLE}.variable_ad_expense_budget ;;
  }

  measure: sum_estimated_revenue {
    group_label: "Estimated Revenue"
    label: "Estimated Revenue"
    description: "Use this field to track aggregated estimated revenue."
    type: sum
    value_format_name: usd
    sql: ${estimated_revenue} ;;
  }

  measure: avg_estimated_revenue {
    group_label: "Estimated Revenue"
    label: "Average Estimated Revenue"
    description: "Use this field to track average estimated revenue by period."
    type: average
    value_format_name: usd
    sql: ${estimated_revenue} ;;
  }

  measure: runningtotal_estimated_revenue {
    group_label: "Estimated Revenue"
    label: "Running Total Estimated Revenue"
    description: "Use this field to track cumulative estimated revenue for a period."
    type: running_total
    value_format_name: usd
    sql: ${sum_estimated_revenue} ;;
  }

  measure: sum_variable_ad_expense_budget {
    group_label: "VADX"
    label: "Variable Ad Expense Budget"
    description: "Use this field to track aggregated budgeted ad expense for a period."
    type: sum
    value_format_name: usd
    sql: ${variable_ad_expense_budget} ;;
  }

  measure: runningtotal_variable_ad_expense {
    group_label: "VADX"
    label: "Running Total VADX"
    description: "Use this field to track average budgeted ad expense for a period."
    # description: "Sales Amount = Gross Sales - Discounts + Shipping + Taxes"
    type: running_total
    value_format_name: usd
    sql: ${sum_variable_ad_expense_budget} ;;
  }

  measure: avg_variable_ad_expense_budget {
    group_label: "VADX"
    label: "Average Variable Ad Expense Budget"
    description: "Use this field to track cumulative budgeted ad expense for a period."
    type: average
    value_format_name: usd
    sql: ${variable_ad_expense_budget} ;;
  }

  measure: count {
    type: count
    drill_fields: [subsidiary_name, brand_parent_name]
  }
}
