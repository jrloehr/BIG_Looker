connection: "big_superlayer"

# include all the views
include: "/views/**/*.view"

datagroup: ordered_sales_detail_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: ordered_sales_detail_default_datagroup

explore: fact_sales_detail {
    join: dim_customer {
      type: left_outer
      sql_on: ${fact_sales_detail.customer_id} = ${dim_customer.customer_id} ;;
      relationship: many_to_one
    }

   join: dim_customer_types {
    type: left_outer
    sql_on: ${fact_sales_detail.customer_type_id2} = ${dim_customer_types.customer_type_id} ;;
    relationship: many_to_one
  }

  join: dim_date {
    type: left_outer
    sql_on: ${fact_sales_detail.ordered_date} = ${dim_date.date_date} ;;
    relationship: many_to_one
  }
  join: dim_item {
    type: left_outer
    sql_on: ${fact_sales_detail.item_id} = ${dim_item.item_id} ;;
    relationship: many_to_one
  }

  join: dim_location {
    type: left_outer
    sql_on: ${fact_sales_detail.location_id} = ${dim_location.location_id} ;;
    relationship: many_to_one
  }

  join: dim_subsidiary {
    type: left_outer
    sql_on: ${fact_sales_detail.subsidiary_id} = ${dim_subsidiary.subsidiary_id} ;;
    relationship: many_to_one
  }
}
