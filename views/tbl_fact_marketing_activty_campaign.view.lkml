view: fact_marketing_activty_campaign {
  sql_table_name: dbo.tblFactMarketingActivty_Campaign ;;

  dimension: brand_parent_name {
    type: string
    sql: ${TABLE}.brand_parent_name ;;
  }

  dimension_group: date {
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
    sql: ${TABLE}.date ;;
  }

  dimension: existing_cogs {
    type: string
    sql: ${TABLE}.existing_cogs ;;
  }

  dimension: existing_customer_count {
    type: number
    sql: ${TABLE}.existing_customer_count ;;
  }

  dimension: existing_item_count {
    type: number
    sql: ${TABLE}.existing_item_count ;;
  }

  dimension: existing_margin_dollars {
    type: string
    sql: ${TABLE}.existing_margin_dollars ;;
  }

  dimension: existing_order_count {
    type: number
    sql: ${TABLE}.existing_order_count ;;
  }

  dimension: existing_total_sales_b4_returns {
    type: string
    sql: ${TABLE}.existing_total_sales_b4_returns ;;
  }

  dimension: hard_bounce_count {
    type: number
    sql: ${TABLE}.hard_bounce_count ;;
  }

  dimension: marketing_ad_content {
    type: string
    sql: ${TABLE}.marketing_ad_content ;;
  }

  dimension: marketing_campaign_name {
    type: string
    sql: ${TABLE}.marketing_campaign_name ;;
  }

  dimension: marketing_channel_grouping {
    type: string
    sql: ${TABLE}.marketing_channel_grouping ;;
  }

  dimension: marketing_clicks {
    type: number
    sql: ${TABLE}.marketing_clicks ;;
  }

  dimension: marketing_impressions {
    type: number
    sql: ${TABLE}.marketing_impressions ;;
  }

  dimension: marketing_source {
    type: string
    sql: ${TABLE}.marketing_source ;;
  }

  dimension: marketing_spend {
    type: number
    sql: ${TABLE}.marketing_spend ;;
  }

  dimension: new_cogs {
    type: string
    sql: ${TABLE}.new_cogs ;;
  }

  dimension: new_customer_count {
    type: number
    sql: ${TABLE}.new_customer_count ;;
  }

  dimension: new_item_count {
    type: number
    sql: ${TABLE}.new_item_count ;;
  }

  dimension: new_margin_dollars {
    type: string
    sql: ${TABLE}.new_margin_dollars ;;
  }

  dimension: new_order_count {
    type: number
    sql: ${TABLE}.new_order_count ;;
  }

  dimension: new_total_sales_b4_returns {
    type: string
    sql: ${TABLE}.new_total_sales_b4_returns ;;
  }

  dimension: page_views {
    type: number
    sql: ${TABLE}.page_views ;;
  }

  dimension: session_count {
    type: number
    sql: ${TABLE}.session_count ;;
  }

  dimension: total_cogs {
    type: string
    sql: ${TABLE}.total_cogs ;;
  }

  dimension: total_customer_count {
    type: number
    sql: ${TABLE}.total_customer_count ;;
  }

  dimension: total_item_count {
    type: number
    sql: ${TABLE}.total_item_count ;;
  }

  dimension: total_margin_dollars {
    type: string
    sql: ${TABLE}.total_margin_dollars ;;
  }

  dimension: total_order_count {
    type: number
    sql: ${TABLE}.total_order_count ;;
  }

  dimension: total_sales_b4_returns {
    type: string
    sql: ${TABLE}.total_sales_b4_returns ;;
  }

  dimension: visitor_count {
    type: number
    sql: ${TABLE}.visitor_count ;;
  }

  measure: count {
    type: count
    drill_fields: [brand_parent_name, marketing_campaign_name]
  }
}
