connection: "big_superlayer"

# include all the views
include: "/views/**/*.view"

datagroup: ordered_sales_detail_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "24 hours"
}

persist_with: ordered_sales_detail_default_datagroup

explore: cohort_tool {}

explore: fact_sales_detail {

    view_label: "Sales Detail"

    join: dim_customer {
      view_label: "Customer"
      type: left_outer
      sql_on: ${fact_sales_detail.customer_id} = ${dim_customer.customer_id} ;;
      relationship: many_to_one
    }

   join: dim_sales_channel {
    view_label: "Sales Channel"
    type: left_outer
    sql_on: ${fact_sales_detail.customer_type_id2} = ${dim_sales_channel.customer_type_id} ;;
    relationship: many_to_one
  }

  join: dim_date {
    type: left_outer
    sql_on: ${fact_sales_detail.ordered_date} = ${dim_date.date_date} ;;
    relationship: many_to_one
  }

  join: dim_item {
    view_label: "Products"
    type: left_outer
    sql_on: ${fact_sales_detail.item_id} = ${dim_item.item_id} ;;
    relationship: many_to_one
  }

  join: dim_parent_company {
    view_label: "Parent Company"
    type: left_outer
    sql_on: ${fact_sales_detail.subsidiary_id} = ${dim_parent_company.subsidiary_id} ;;
    relationship: many_to_one
  }

  join: dim_brand {
    view_label: "Brands"
    type: left_outer
    sql_on: ${fact_sales_detail.location_id} = ${dim_brand.brand_id} ;;
    relationship: many_to_one
  }

  # join: dim_location {
  #   view_label: "Brands"
  #   type: left_outer
  #   sql_on: ${fact_sales_detail.location_id} = ${dim_location.location_id} ;;
  #   relationship: many_to_one
  # }

  # join: dim_subsidiary {
  #   view_label: "Subsidiaries"
  #   type: left_outer
  #   sql_on: ${fact_sales_detail.subsidiary_id} = ${dim_subsidiary.subsidiary_id} ;;
  #   relationship: many_to_one
  # }

  ###Product Rollup Table - used for benchmarking
  # join: product_category_rollup {
  #   type: left_outer
  #   sql_on: ${fact_sales_detail.ordered_date} = ${product_category_rollup.ordered_date} AND ${dim_item.product_category} = ${product_category_rollup.product_category} ;;
  #   # sql_on: ${dim_item.product_category} = ${product_category_rollup.product_category} ;;
  #   relationship: many_to_one
  # }
}
