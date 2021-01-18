view: dim_customer {
  sql_table_name: dbo.DimCustomer ;;

  dimension: city {
    type: string
    sql: ${TABLE}.City ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.Customer_id ;;
  }

  dimension: customer_name {
    type: string
    sql: ${TABLE}.Customer_Name ;;
  }

  dimension: customer_state {
    type: string
    sql: ${TABLE}.Customer_State ;;
  }

  dimension: customer_type_id {
    type: number
    sql: ${TABLE}.customer_type_id ;;
  }

  dimension: days_on_file {
    type: number
    sql: ${TABLE}.Days_On_File ;;
  }

  dimension: days_since_last {
    type: number
    sql: ${TABLE}.Days_Since_Last ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.Email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.FirstName ;;
  }

  dimension_group: first_order {
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
    sql: ${TABLE}.First_Order_Date ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.LastName ;;
  }

  dimension_group: last_order {
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
    sql: ${TABLE}.Last_Order_Date ;;
  }

  dimension: zip_code {
    type: zipcode
    sql: ${TABLE}.ZipCode ;;
  }

  dimension: firsttime_or_returning {
    type: string
    sql:
    CASE
    WHEN ${first_order_date} = ${last_order_date} THEN 'First-Time'
    ELSE 'Returning'
    END;;
  }

  measure: count_firsttime_or_returning {
    type: number
    sql: COUNT(${firsttime_or_returning}) ;;
  }

  measure: count {
    type: count
    drill_fields: [customer_name, first_name, last_name]
  }
}
