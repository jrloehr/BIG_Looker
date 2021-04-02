connection: "big_superlayer"

# include all the views
include: "/views/**/*.view"

datagroup: order_sales_detail_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "24 hours"
}

persist_with: order_sales_detail_datagroup

# explore: cohort_tool {}

explore: fact_marketing_activty_campaign {

  cancel_grouping_fields: [fact_marketing_activty_campaign.rolling_roas_user_selection]

  label: "Marketing Data"
  view_label: "Marketing Detail"

  join: fact_budget {
    view_label: "Budget and Forecast"
    type: inner
    sql_on: ${fact_marketing_activty_campaign.date_date} = ${fact_budget.date_date}
          AND ${fact_marketing_activty_campaign.brand_parent_id} = ${fact_budget.brand_parent_id}
          ;;
    relationship: many_to_one
  }

}

explore: fact_sales_detail {
    label: "Sales Data"
    view_label: "Sales Detail"

    query: order_count_by_month {
    description: "Number of orders placed by month in 2019"
    dimensions: [fact_sales_detail.ordered_month]
    measures: [fact_sales_detail.count_etail_order_id]
    filters: [fact_sales_detail.ordered_date: "2018"]
  }

  query: total_yearly_sales {
    description: "Total Sales by Year"
    dimensions: [fact_sales_detail.ordered_year]
    measures: [fact_sales_detail.sum_total_sales]
  }

  join: dim_customer {
    view_label: "Customer"
    type: left_outer
    sql_on: ${fact_sales_detail.customer_id} = ${dim_customer.customer_id} ;;
    relationship: many_to_one
  }

  # join: dim_date {
  #   type: left_outer
  #   sql_on: ${fact_sales_detail.ordered_date} = ${dim_date.date_date} ;;
  #   relationship: many_to_one
  # }

  join: dim_item {
    view_label: "Products"
    type: left_outer
    sql_on: ${fact_sales_detail.item_id} = ${dim_item.item_id} ;;
    relationship: many_to_one
  }

  join: dim_sales_channel {
    view_label: "Sales Channel"
    type: left_outer
    sql_on: ${fact_sales_detail.customer_type_id} = ${dim_sales_channel.customer_type_id} ;;
    relationship: many_to_one
  }

  join: dim_brand {
    view_label: "Brands"
    type: left_outer
    sql_on: ${fact_sales_detail.location_id} = ${dim_brand.brand_id} ;;
    relationship: many_to_one
  }

  join: fact_budget {
    view_label: "Budget and Forecast"
    type: inner
    sql_on: ${fact_sales_detail.ordered_date} = ${fact_budget.date_date}
    AND ${fact_sales_detail.location_id} = ${fact_budget.brand_parent_id}
    ;;
    relationship: many_to_one
  }

# AND ${fact_sales_detail.location_id} = ${dim_estimated_budget.brand_id}

  join: dim_market_channel_direct_allocation {
    view_label: "Marketing Channel"
    type: inner
    sql_on: ${fact_sales_detail.marketing_channel_id} = ${dim_market_channel_direct_allocation.marketing_channel_id};;
    relationship: many_to_one
  }

  # ##### JOINED IN THE CUSTOMER LIFETIME VALUE PDT #####
  # join: customer_order_facts {
  #   view_label: "Customer Order Facts"
  #   type: left_outer
  #   relationship: many_to_one
  #   sql_on: ${fact_sales_detail.customer_id} = ${customer_order_facts.customer_id} ;;
  # }

  # join: dim_customer_types {
  #   view_label: "Sales Channel"
  #   type: left_outer
  #   sql_on: ${fact_sales_detail.customer_type_id} = ${dim_customer_types.customer_type_id};;
  #   relationship: many_to_one
  # }

  # join: dim_parent_company {
  #   view_label: "Parent Company"
  #   type: left_outer
  #   sql_on: ${fact_sales_detail.subsidiary_id} = ${dim_parent_company.subsidiary_id} ;;
  #   relationship: many_to_one
  # }

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

  # ##Product Rollup Table - used for benchmarking
  # join: product_category_rollup {
  #   type: left_outer
  #   sql_on: ${fact_sales_detail.ordered_date} = ${product_category_rollup.ordered_date} AND ${dim_item.product_category} = ${product_category_rollup.product_category} ;;
  #   # sql_on: ${dim_item.product_category} = ${product_category_rollup.product_category} ;;
  #   relationship: many_to_one
  # }

}
