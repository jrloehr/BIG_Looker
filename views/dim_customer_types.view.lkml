view: dim_customer_types {
  sql_table_name: dbo.DimCustomerTypes ;;

  dimension: customer_type_id {
    type: number
    sql: ${TABLE}.customer_type_id ;;
  }

  dimension: customer_type_name {
    type: string
    sql: ${TABLE}.CustomerTypeName ;;
  }

  measure: count {
    type: count
    drill_fields: [customer_type_name]
  }
}
