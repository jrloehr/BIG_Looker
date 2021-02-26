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

  dimension: marketing_source {
    type: string
    sql: ${TABLE}.marketing_source ;;
  }

  dimension: existing_customer_count {
    type: number
    sql: ${TABLE}.existing_customer_count ;;
  }

  measure: existing_customer_count_total {
    type: sum
    sql: ${existing_customer_count} ;;
  }

  dimension: existing_item_count {
    type: number
    sql: ${TABLE}.existing_item_count ;;
  }

  measure: existing_item_count_total {
    type: sum
    sql: ${existing_item_count} ;;
  }

  dimension: existing_order_count {
    type: number
    sql: ${TABLE}.existing_order_count ;;
  }

  measure: existing_order_count_total {
    type: sum
    sql: ${existing_order_count} ;;
  }

  dimension: hard_bounce_count {
    type: number
    sql: ${TABLE}.hard_bounce_count ;;
  }

  measure: hard_bounce_count_total {
    type: sum
    sql: ${hard_bounce_count} ;;
  }

  dimension: marketing_clicks {
    type: number
    sql: ${TABLE}.marketing_clicks ;;
  }

  measure: marketing_clicks_total {
    type: sum
    sql: ${marketing_clicks} ;;
  }

  dimension: marketing_impressions {
    type: number
    sql: ${TABLE}.marketing_impressions ;;
  }

  measure: marketing_impressions_total {
    type: sum
    sql: ${marketing_impressions} ;;
  }

  dimension: new_customer_count {
    type: number
    sql: ${TABLE}.new_customer_count ;;
  }

  measure: new_customer_count_total {
    type: sum
    sql: ${new_customer_count} ;;
  }

  dimension: new_item_count {
    type: number
    sql: ${TABLE}.new_item_count ;;
  }

  measure: new_item_count_total {
    type: sum
    sql: ${new_item_count} ;;
  }

  dimension: new_order_count {
    type: number
    sql: ${TABLE}.new_order_count ;;
  }

  measure: new_order_count_total {
    type: sum
    sql: ${new_order_count} ;;
  }

  dimension: session_count {
    type: number
    sql: ${TABLE}.session_count ;;
  }

  measure: session_count_total {
    type: sum
    sql: ${session_count} ;;
  }

  dimension: page_views {
    type: number
    sql: ${TABLE}.page_views ;;
  }

  measure: page_views_total {
    type: sum
    sql: ${page_views} ;;
  }

  dimension: total_customer_count {
    type: number
    sql: ${TABLE}.total_customer_count ;;
  }

  measure: total_customer_count_total {
    type: sum
    sql: ${total_customer_count} ;;
  }

  dimension: total_item_count {
    type: number
    sql: ${TABLE}.total_item_count ;;
  }

  measure: total_item_count_total {
    type: sum
    sql: ${total_item_count} ;;
  }

  dimension: total_order_count {
    type: number
    sql: ${TABLE}.total_order_count ;;
  }

  measure: total_order_count_total {
    type: sum
    sql: ${total_order_count} ;;
  }

  dimension: visitor_count {
    type: number
    sql: ${TABLE}.visitor_count ;;
  }

  measure: visitor_count_total {
    type: sum
    sql: ${visitor_count} ;;
  }


# DOLLAR DIMENSIONS HERE

  dimension: existing_cogs {
    type: number
    sql: ${TABLE}.existing_cogs ;;
  }

  measure: existing_cogs_total {
    type: sum
    value_format_name: usd
    sql: ${existing_cogs} ;;
  }

  dimension: existing_margin_dollars {
    type: number
    sql: ${TABLE}.existing_margin_dollars ;;
  }

  measure: existing_margin_dollars_total {
    type: sum
    value_format_name: usd
    sql: ${existing_margin_dollars} ;;
  }

  dimension: existing_total_sales_b4_returns {
    type: number
    sql: ${TABLE}.existing_total_sales_b4_returns ;;
  }

  measure: existing_total_sales_b4_returns_total {
    type: sum
    value_format_name: usd
    sql: ${existing_total_sales_b4_returns} ;;
  }

  dimension: marketing_spend {
    type: number
    sql: ${TABLE}.marketing_spend ;;
  }

  measure: marketing_spend_total {
    type: sum
    value_format_name: usd
    sql: ${marketing_spend} ;;
  }

  dimension: new_cogs {
    type: number
    sql: ${TABLE}.new_cogs ;;
  }

  measure: new_cogs_total {
    type: sum
    value_format_name: usd
    sql: ${new_cogs} ;;
  }

  dimension: new_margin_dollars {
    type: number
    sql: ${TABLE}.new_margin_dollars ;;
  }

  measure: new_margin_dollars_total {
    type: sum
    value_format_name: usd
    sql: ${new_margin_dollars} ;;
  }

  dimension: new_total_sales_b4_returns {
    type: number
    sql: ${TABLE}.new_total_sales_b4_returns ;;
  }

  measure: new_total_sales_b4_returns_total {
    type: sum
    value_format_name: usd
    sql: ${new_total_sales_b4_returns} ;;
  }

  dimension: total_cogs {
    type: number
    sql: ${TABLE}.total_cogs ;;
  }

  measure: total_cogs_total {
    type: sum
    value_format_name: usd
    sql: ${total_cogs} ;;
  }

  dimension: total_margin_dollars {
    type: number
    sql: ${TABLE}.total_margin_dollars ;;
  }

  measure: total_margin_dollars_total {
    type: sum
    value_format_name: usd
    sql: ${total_margin_dollars} ;;
  }

  dimension: total_sales_b4_returns {
    type: number
    sql: ${TABLE}.total_sales_b4_returns ;;
  }

  measure: total_sales_b4_returns_total {
    type: sum
    value_format_name: usd
    sql: ${total_sales_b4_returns} ;;
  }

  measure: count {
    type: count
    drill_fields: [brand_parent_name, marketing_campaign_name]
  }
}
