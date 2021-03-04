view: estimatedbudget {
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
    type: string
    sql: ${TABLE}.brand_parent_name ;;
  }

  dimension: date {
    type: string
    sql: ${TABLE}.date ;;
  }

  dimension: estimated_revenue {
    type: number
    sql: ${TABLE}.estimated_revenue ;;
  }

  dimension: subsidiary_id {
    type: number
    sql: ${TABLE}.subsidiary_id ;;
  }

  dimension: subsidiary_name {
    type: string
    sql: ${TABLE}.subsidiary_name ;;
  }

  dimension: variable_ad_expense_budget {
    type: number
    sql: ${TABLE}.variable_ad_expense_budget ;;
  }

  measure: count {
    type: count
    drill_fields: [subsidiary_name, brand_parent_name]
  }
}
