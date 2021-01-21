view: dim_customer {
  sql_table_name: dbo.DimCustomer ;;

  dimension: city {
    label: "City"
    type: string
    sql: ${TABLE}.City ;;
  }

  dimension: customer_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Customer_id ;;
  }

  dimension: customer_name {
    label: "Customer Name"
    type: string
    sql: ${TABLE}.Customer_Name ;;
  }

  dimension: customer_state {
    label: "Customer State"
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
    label: "Email"
    type: string
    sql: ${TABLE}.Email ;;
  }

  dimension: first_name {
    label: "First Name"
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
    label: "Last Name"
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
    label: "Customer Zip Code"
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

  measure: count_firsttime_customers {
    type: count_distinct
    sql: ${customer_id} ;;
    filters: [firsttime_or_returning: "First-Time"]
    drill_fields: [customer_drill*]
  }

  measure: count_returning_customers {
    type: count_distinct
    sql: ${customer_id} ;;
    filters: [firsttime_or_returning: "Returning"]
    drill_fields: [customer_drill*, count_returning_customers]
  }

  measure: count {
    type: count
    drill_fields: [customer_name, first_name, last_name]
  }

  set: customer_drill {
    fields: [city, days_on_file]
  }
}
