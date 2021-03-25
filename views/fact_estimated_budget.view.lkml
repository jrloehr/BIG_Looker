view: fact_budget {
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
    label: "Budget/VADX Date"
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

  dimension: budget_revenue {
    hidden: yes
    type: number
    sql: ${TABLE}.estimated_revenue ;;
    description: "Use this field to track Budget revenue."
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

  measure: sum_budget_revenue {
    group_label: "Budget Revenue"
    label: "Budget Revenue"
    description: "Use this field to track aggregated Budget revenue."
    type: sum
    value_format_name: usd
    sql: ${budget_revenue} ;;
  }

  measure: avg_budget_revenue {
    group_label: "Budget Revenue"
    label: "Daily Average Budget Revenue"
    description: "Use this field to track average Budget revenue by period."
    type: average
    value_format_name: usd
    sql: ${budget_revenue} ;;
  }

  measure: runningtotal_budget_revenue {
    group_label: "Budget Revenue"
    label: "Cumulative Daily Budget Revenue"
    description: "Use this field to track cumulative Budget revenue for a period."
    type: running_total
    value_format_name: usd
    sql: ${sum_budget_revenue} ;;
  }

  measure: sum_variable_ad_expense_budget {
    group_label: "VADX"
    label: "Daily Variable Ad Expense Budget"
    description: "Use this field to track aggregated budgeted ad expense for a period."
    type: sum
    value_format_name: usd
    sql: ${variable_ad_expense_budget} ;;
  }

  measure: runningtotal_variable_ad_expense {
    group_label: "VADX"
    label: "Cumulative VADX Budget"
    description: "Use this field to track average budgeted ad expense for a period."
    # description: "Sales Amount = Gross Sales - Discounts + Shipping + Taxes"
    type: running_total
    value_format_name: usd
    sql: ${sum_variable_ad_expense_budget} ;;
  }

  measure: avg_variable_ad_expense_budget {
    group_label: "VADX"
    label: "Average Daily Variable Ad Expense Budget"
    description: "Use this field to track cumulative budgeted ad expense for a period."
    type: average
    value_format_name: usd
    sql: ${variable_ad_expense_budget} ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [subsidiary_name, brand_parent_name]
  }
}
