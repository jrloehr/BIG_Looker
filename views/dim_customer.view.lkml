view: dim_customer {
  sql_table_name: edw.DimCustomer ;;

  dimension: customer_id {
    primary_key: yes
    hidden: no
    type: number
    sql: ${TABLE}.Customer_id ;;
    description: "This may deprecate when BIG has a BIG Customer ID."
  }

  dimension: customer_type_id {
    hidden: yes
    type: number
    sql: ${TABLE}.customer_type_id ;;
    description: "This is technically the 'Sales Channel'... or the type of buyer."
  }

  dimension: days_on_file {
    hidden: yes
    type: number
    sql: ${TABLE}.Days_On_File ;;
  }

  dimension: days_since_last {
    hidden: yes
    type: number
    sql: ${TABLE}.Days_Since_Last ;;
  }

  dimension: email {
    hidden: no
    label: "Email"
    type: string
    sql: ${TABLE}.Email ;;
  }

  dimension: first_name {
    hidden: no
    label: "First Name"
    type: string
    sql: ${TABLE}.FirstName ;;
  }

  dimension: last_name {
    hidden: no
    label: "Last Name"
    type: string
    sql: ${TABLE}.LastName ;;
  }

  dimension: first_last_name {
    hidden: no
    label: "First and Last Name"
    type: string
    sql: ${first_name} + " " + ${last_name} ;;
  }

  dimension: customer_name {
    hidden: yes
    label: "Customer Name"
    type: string
    sql: ${TABLE}.Customer_Name ;;
  }

  dimension: city {
    hidden: no
    label: "Customer City"
    type: string
    sql: ${TABLE}.City ;;
  }

  dimension: zip_code {
    hidden: no
    label: "Customer Zip Code"
    type: zipcode
    sql: ${TABLE}.ZipCode ;;
  }

  dimension: customer_state {
    hidden: no
    label: "Customer State"
    type: string
    sql: ${TABLE}.Customer_State ;;
  }

  dimension: full_name {
    hidden: yes
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
    description: "This field was created by Looker team - could be very useful as a concept on how to quickly access/market to customers and many other uses."
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
    label: "First Order"
    convert_tz: no
    datatype: date
    sql: ${TABLE}.First_Order_Date ;;
    description: "Use this field to determine if a customer was a new or returning customer at a given point in time. If their first order was within the required timeframe, then they were a first time customer in that timeframe."
  }

  dimension_group: last_order {
    hidden: no
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    label: "Last Order"
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Last_Order_Date ;;
  }

  dimension: new_or_returning {
    label: "New or Returning - Current"
    type: string
    description: "Validated by SJ on 2/4/2021 using 2/1/2021 data from Looker and Shopify - see 89 vs 90 and 289 vs. 292 but both reports come out to 308 total. This may also need adjustment to see historical first-time customers - in other words, as of today, 'X' was a first-time customer, but as of 2 months from now, they may not be. Will probably need to compare First_Order_Date to Order_Date in order to tell if a specific historical order was their first purchase. This is the way Shopify calculates."
    sql:
    CASE
      WHEN ${first_order_date} = ${last_order_date} THEN 'New'
      ELSE 'Returning'
    END;;
    hidden: no
  }

  measure: count_new_customers {
    label: "Count of New Customers"
    type: count_distinct
    sql: ${customer_id} ;;
    filters: [new_or_returning: "New"]
    drill_fields: [customer_drill*]
    description: "Use this field to get a count of all First-Time customers at this point in time."
  }

  measure: count_returning_customers {
    label: "Count of Returning Customers"
    type: count_distinct
    sql: ${customer_id} ;;
    filters: [new_or_returning: "Returning"]
    drill_fields: [customer_drill*, count_returning_customers]
    description: "Use this field to get a count of all Returning customers at this point in time."
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [customer_name, first_name, last_name]
  }

  set: customer_drill {
    fields: [city, days_on_file]
  }
}
