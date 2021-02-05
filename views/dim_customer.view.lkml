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

  dimension: full_name {
    type: string
    sql: CONCAT(${first_name}, ' ', ${last_name});;

    link: {
      label: "Customer Lookup Dashboard"
      url: "/dashboards-next/4?Full+Name={{ value | encode_uri }}"
      icon_url: "https://cdn.shopify.com/s/files/1/0079/9028/0243/files/favicon_82c098c7-270d-461b-b951-ce1bca63e8aa_32x32.png?v=1572415227"
    }
    action: {
      label: "Email Promotion to Customer"
      url: "https://desolate-refuge-53336.herokuapp.com/posts"
      icon_url: "https://sendgrid.com/favicon.ico"
      param: {
        name: "some_auth_code"
        value: "abc123456"
      }
      form_param: {
        name: "Subject"
        required: yes
        default: "Thank you {{ full_name._value }}"
      }
      form_param: {
        name: "Body"
        type: textarea
        required: yes
        default:
        "Dear {{ full_name._value }},

        Thanks for your loyalty to Beauty Industry Group!  We'd like to offer you a 15% discount
        on your next purchase!  Just use the code BIGLOYALTY when checking out!

        Your friends at Beauty Industry Group"
      }
    }
    required_fields: [full_name]
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
    description: "Validated by SJ on 2/4/2021 using 2/1/2021 data from Looker and Shopify - see 89 vs 90 and 289 vs. 292 but both reports come out to 308 total."
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
