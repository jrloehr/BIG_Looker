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

  dimension: hard_bounce_count {
    hidden: yes
    type: number
    sql: ${TABLE}.hard_bounce_count ;;
  }

  measure: hard_bounce_count_total {
    group_label: "Ad Metrics"
    label: "Hard Bounce Count"
    type: sum
    sql: ${hard_bounce_count} ;;
  }

  dimension: marketing_clicks {
    hidden: yes
    type: number
    sql: ${TABLE}.marketing_clicks ;;
  }

  measure: marketing_clicks_total {
    group_label: "Ad Metrics"
    label: "Marketing Clicks"
    type: sum
    sql: ${marketing_clicks} ;;
  }

  dimension: marketing_impressions {
    hidden: yes
    type: number
    sql: ${TABLE}.marketing_impressions ;;
  }

  measure: marketing_impressions_total {
    group_label: "Ad Metrics"
    label: "Marketing Impressions"
    type: sum
    sql: ${marketing_impressions} ;;
  }

  dimension: session_count {
    hidden: yes
    type: number
    sql: ${TABLE}.session_count ;;
  }

  measure: session_count_total {
    group_label: "Ad Metrics"
    label: "Session Count"
    type: sum
    sql: ${session_count} ;;
  }

  dimension: page_views {
    hidden: yes
    type: number
    sql: ${TABLE}.page_views ;;
  }

  measure: page_views_total {
    group_label: "Ad Metrics"
    label: "Page Views"
    type: sum
    sql: ${page_views} ;;
  }

  dimension: visitor_count {
    hidden: yes
    type: number
    sql: ${TABLE}.visitor_count ;;
  }

  measure: visitor_count_total {
    group_label: "Ad Metrics"
    label: "Visitor Count"
    type: sum
    sql: ${visitor_count} ;;
  }

  # NEW METRICS

  dimension: new_customer_count {
    hidden: yes
    type: number
    sql: ${TABLE}.new_customer_count ;;
  }

  measure: new_customer_count_total {
    group_label: "New Customers"
    label: "New | Customer Count"
    type: sum
    sql: ${new_customer_count} ;;
  }

  dimension: new_item_count {
    hidden: yes
    type: number
    sql: ${TABLE}.new_item_count ;;
  }

  measure: new_item_count_total {
    group_label: "New Customers"
    label: "New | Item Count"
    type: sum
    sql: ${new_item_count} ;;
  }

  dimension: new_order_count {
    hidden: yes
    type: number
    sql: ${TABLE}.new_order_count ;;
  }

  measure: new_order_count_total {
    group_label: "New Customers"
    label: "New | Order Count"
    type: sum
    sql: ${new_order_count} ;;
  }

# NEW DOLLAR METRICS

  dimension: new_cogs {
    hidden: yes
    type: number
    sql: ${TABLE}.new_cogs ;;
  }

  measure: new_cogs_total {
    group_label: "New Customers"
    label: "New | COGS"
    type: sum
    value_format_name: usd
    sql: ${new_cogs} ;;
  }

  dimension: new_margin_dollars {
    hidden: yes
    type: number
    sql: ${TABLE}.new_margin_dollars ;;
  }

  measure: new_margin_dollars_total {
    group_label: "New Customers"
    label: "New | Margin Dollars"
    type: sum
    value_format_name: usd
    sql: ${new_margin_dollars} ;;
  }

  dimension: new_total_sales_b4_returns {
    hidden: yes
    type: number
    sql: ${TABLE}.new_total_sales_b4_returns ;;
  }

  measure: new_total_sales_b4_returns_total {
    group_label: "New Customers"
    label: "New | Sales"
    type: sum
    value_format_name: usd
    sql: ${new_total_sales_b4_returns} ;;
  }

  measure: new_AOV {
    group_label: "New Customers"
    label: "New | Average Order Value"
    type: number
    value_format_name: usd
    sql: ${new_total_sales_b4_returns_total} / ${new_order_count_total} ;;
  }

  # EXISTING METRICS

  dimension: existing_customer_count {
    hidden: yes
    type: number
    sql: ${TABLE}.existing_customer_count ;;
  }

  measure: existing_customer_count_total {
    group_label: "Existing Customers"
    label: "Existing | Customer Count"
    type: sum
    sql: ${existing_customer_count} ;;
  }

  dimension: existing_item_count {
    hidden: yes
    type: number
    sql: ${TABLE}.existing_item_count ;;
  }

  measure: existing_item_count_total {
    group_label: "Existing Customers"
    label: "Existing | Item Count"
    type: sum
    sql: ${existing_item_count} ;;
  }

  dimension: existing_order_count {
    hidden: yes
    type: number
    sql: ${TABLE}.existing_order_count ;;
  }

  measure: existing_order_count_total {
    group_label: "Existing Customers"
    label: "Existing | Order Count"
    type: sum
    sql: ${existing_order_count} ;;
  }

# EXISTING DOLLAR METRICS

  dimension: existing_cogs {
    hidden: yes
    type: number
    sql: ${TABLE}.existing_cogs ;;
  }

  measure: existing_cogs_total {
    group_label: "Existing Customers"
    label: "Existing | COGS"
    type: sum
    value_format_name: usd
    sql: ${existing_cogs} ;;
  }

  dimension: existing_margin_dollars {
    hidden: yes
    type: number
    sql: ${TABLE}.existing_margin_dollars ;;
  }

  measure: existing_margin_dollars_total {
    group_label: "Existing Customers"
    label: "Existing | Margin Dollars"
    type: sum
    value_format_name: usd
    sql: ${existing_margin_dollars} ;;
  }

  dimension: existing_total_sales_b4_returns {
    hidden: yes
    type: number
    sql: ${TABLE}.existing_total_sales_b4_returns ;;
  }

  measure: existing_total_sales_b4_returns_total {
    group_label: "Existing Customers"
    label: "Existing | Sales"
    type: sum
    value_format_name: usd
    sql: ${existing_total_sales_b4_returns} ;;
  }

  measure: existing_AOV {
    group_label: "Existing Customers"
    label: "Existing | Average Order Value"
    type: number
    value_format_name: usd
    sql: ${existing_total_sales_b4_returns_total} / ${existing_order_count_total} ;;
  }

  # TOTAL METRICS

  dimension: new_existing_customer_count {
    hidden: yes
    type: number
    sql: ${TABLE}.total_customer_count ;;
  }

  measure: new_existing_customer_count_total {
    group_label: "All Customers"
    label: "New & Existing | Customer Count"
    type: sum
    sql: ${new_existing_customer_count} ;;
  }

  dimension: new_existing_item_count {
    hidden: yes
    type: number
    sql: ${TABLE}.total_item_count ;;
  }

  measure: new_existing_item_count_total {
    group_label: "All Customers"
    label: "New & Existing | Item Count"
    type: sum
    sql: ${new_existing_item_count} ;;
  }

  dimension: new_existing_order_count {
    hidden: yes
    type: number
    sql: ${TABLE}.total_order_count ;;
  }

  measure: new_existing_order_count_total {
    group_label: "All Customers"
    label: "New & Existing | Order Count"
    type: sum
    sql: ${new_existing_order_count} ;;
  }


# TOTAL DOLLAR METRICS

  dimension: new_existing_cogs {
    hidden: yes
    type: number
    sql: ${TABLE}.total_cogs ;;
  }

  measure: new_existing_cogs_total {
    group_label: "All Customers"
    label: "New & Existing | COGS"
    type: sum
    value_format_name: usd
    sql: ${new_existing_cogs} ;;
  }

  dimension: new_existing_margin_dollars {
    hidden: yes
    type: number
    sql: ${TABLE}.total_margin_dollars ;;
  }

  measure: new_existing_margin_dollars_total {
    group_label: "All Customers"
    label: "New & Existing | Margin Dollars"
    type: sum
    value_format_name: usd
    sql: ${new_existing_margin_dollars} ;;
  }

  dimension: new_existing_total_sales_b4_returns {
    hidden: yes
    type: number
    sql: ${TABLE}.total_sales_b4_returns ;;
  }

  measure: new_existing_total_sales_b4_returns_total {
    group_label: "All Customers"
    label: "New & Existing | Sales"
    type: sum
    value_format_name: usd
    sql: ${new_existing_total_sales_b4_returns} ;;
  }

  measure: new_existing_AOV {
    group_label: "All Customers"
    label: "New & Existing | Average Order Value"
    type: number
    value_format_name: usd
    sql: ${new_existing_total_sales_b4_returns_total} / ${new_existing_order_count_total} ;;
  }

  # ROAS

  # measure: existing_roas_avg {
  #   group_label: "ROAS"
  #   label: "Existing | ROAS Average"
  #   type: average
  #   value_format_name: usd
  #   # sql: CASE
  #   # WHEN ${marketing_spend} <> 0 THEN ${existing_total_sales_b4_returns} / ${marketing_spend}
  #   # ELSE ${existing_total_sales_b4_returns}
  #   # END;;
  #   sql: AVG(${existing_total_sales_b4_returns}) / AVG(${marketing_spend}) ;;
  # }

  # measure: new_roas_avg {
  #   group_label: "ROAS"
  #   label: "New | ROAS Average"
  #   type: average
  #   value_format_name: usd
  #   # sql: CASE
  #   # WHEN ${marketing_spend} <> 0 THEN ${new_total_sales_b4_returns} / ${marketing_spend}
  #   # ELSE ${new_total_sales_b4_returns}
  #   # END;;
  #   sql: AVG(${new_total_sales_b4_returns}) / AVG(${marketing_spend}) ;;
  # }

#   measure: new_existing_roas_avg {
#     group_label: "ROAS"
#     label: "New & Existing | ROAS Average"
#     type: average
#     value_format_name: usd
#   #   sql: CASE
#   #   WHEN ${marketing_spend} <> 0 THEN ${new_existing_total_sales_b4_returns} / ${marketing_spend}
#   #   ELSE ${new_existing_total_sales_b4_returns}
#   # END;;
#     sql: AVG(${new_existing_total_sales_b4_returns}) / AVG(${marketing_spend}) ;;
# }

  measure: existing_roas_sum {
    group_label: "ROAS"
    label: "Existing | ROAS Total"
    type: number
    value_format_name: usd
    # sql: CASE
    # WHEN ${marketing_spend} <> 0 THEN ${existing_total_sales_b4_returns} / ${marketing_spend}
    # ELSE ${existing_total_sales_b4_returns}
    # END;;
     sql: ${existing_total_sales_b4_returns_total} / NULLIF(${marketing_spend_total}, 0) ;;
  }

  measure: new_roas_sum {
    group_label: "ROAS"
    label: "New | ROAS Total"
    type: number
    value_format_name: usd
    # sql: CASE
    # WHEN ${marketing_spend} <> 0 THEN ${new_total_sales_b4_returns} / ${marketing_spend}
    # ELSE ${new_total_sales_b4_returns}
    # END;;
     sql: ${new_total_sales_b4_returns_total} / NULLIF(${marketing_spend_total}, 0) ;;
  }

  measure: new_existing_roas_sum {
    group_label: "ROAS"
    label: "New & Existing | ROAS Total"
    type: number
    value_format_name: usd
    # sql: CASE
    # WHEN ${marketing_spend} <> 0 THEN ${new_existing_total_sales_b4_returns} / ${marketing_spend}
    # ELSE ${new_existing_total_sales_b4_returns}
    # END;;
    sql: ${new_existing_total_sales_b4_returns_total} / NULLIF(${marketing_spend_total}, 0) ;;
  }

  # MARKETING SPEND METRICS

  dimension: marketing_spend {
    hidden: yes
    type: number
    sql: ${TABLE}.marketing_spend ;;
  }

  measure: marketing_spend_total {
    group_label: "Marketing Spend Metrics"
    label: "Marketing Spend"
    description: "Use for marketing costs. Validated on 3/11/2021. Make sure to include the final day."
    type: sum
    value_format_name: usd
    sql: ${marketing_spend} ;;
  }

  measure: new_existing_spend_per_order_sum {
    group_label: "Marketing Spend Metrics"
    label: "New & Existing | Dollars / Order Total"
    type: number
    value_format_name: usd
    sql: CASE
    WHEN ${new_existing_order_count} <> 0 THEN ${marketing_spend} / ${new_existing_order_count}
    ELSE ${marketing_spend}
    END;;
    # sql: SUM(${marketing_spend}) / SUM(${new_existing_order_count}) ;;
  }

  measure: new_existing_spend_per_customer_sum {
    group_label: "Marketing Spend Metrics"
    label: "New & Existing | Dollars / Customer Total"
    type: number
    value_format_name: usd
    sql: CASE
    WHEN ${new_existing_customer_count} <> 0 THEN ${marketing_spend} / ${new_existing_customer_count}
    ELSE ${marketing_spend}
    END;;
    # sql: SUM(${marketing_spend}) / SUM(${new_existing_customer_count}) ;;
  }

  measure: new_existing_spend_per_item_sum {
    group_label: "Marketing Spend Metrics"
    label: "New & Existing | Dollars / Item Total"
    type: number
    value_format_name: usd
    sql: CASE
    WHEN ${new_existing_item_count} <> 0 THEN ${marketing_spend} / ${new_existing_item_count}
    ELSE ${marketing_spend}
    END;;
    # sql: SUM(${marketing_spend}) / SUM(${new_existing_item_count}) ;;
  }

  # measure: new_existing_spend_per_order_avg {
  #   group_label: "Marketing Spend Metrics"
  #   label: "New & Existing | Dollars / Order Average"
  #   type: number
  #   value_format_name: usd
  #   # sql: CASE
  #   # WHEN ${new_existing_order_count} <> 0 THEN ${marketing_spend} / ${new_existing_order_count}
  #   # ELSE ${marketing_spend}
  #   # END;;
  #   sql: AVG(${marketing_spend}) / AVG(${new_existing_order_count}) ;;
  # }

  # measure: new_existing_spend_per_customer_avg {
  #   group_label: "Marketing Spend Metrics"
  #   label: "New & Existing | Dollars / Customer Average"
  #   type: number
  #   value_format_name: usd
  #   # sql: CASE
  #   # WHEN ${new_existing_customer_count} <> 0 THEN ${marketing_spend} / ${new_existing_customer_count}
  #   # ELSE ${marketing_spend}
  #   # END;;
  #   sql: AVG(${marketing_spend}) / AVG(${new_existing_customer_count}) ;;
  # }

  # measure: new_existing_spend_per_item_avg {
  #   group_label: "Marketing Spend Metrics"
  #   label: "New & Existing | Dollars / Item Average"
  #   type: number
  #   value_format_name: usd
  #   # sql: CASE
  #   # WHEN ${new_existing_item_count} <> 0 THEN ${marketing_spend} / ${new_existing_item_count}
  #   # ELSE ${marketing_spend}
  #   # END;;
  #   sql: AVG(${marketing_spend}) / AVG(${new_existing_item_count}) ;;
  # }

  measure: count {
    type: count
    drill_fields: [brand_parent_name, marketing_campaign_name]
  }

}
