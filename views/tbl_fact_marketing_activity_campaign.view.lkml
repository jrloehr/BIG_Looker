view: fact_marketing_activty_campaign {
  sql_table_name: dbo.tblFactMarketingActivty_Campaign ;;

  parameter: rolling_roas_picker {
    group_label: "User Parameters"
    label: "Rolling ROAS Picker"
    type: number
    allowed_value: { value: "7" }
    allowed_value: { value: "28" }
    allowed_value: { value: "56" }
    default_value: "28"
  }

  dimension: rolling_roas_user_selection {
    group_label: "ROAS"
    type: number
    sql:
    CASE
    WHEN {% parameter rolling_roas_picker %} = '7' THEN 7
    WHEN {% parameter rolling_roas_picker %} = '28' THEN 28
    WHEN {% parameter rolling_roas_picker %} = '56' THEN 56
    ELSE 28
    END ;;
    label: "Rolling ROAS User Selection"
  }

  dimension: brand_parent_name {
    label: "Brand Name"
    type: string
    sql: ${TABLE}.brand_parent_name ;;
    description: "Use this field to group or compare by Brand."
  }

  dimension: brand_parent_id {
    hidden: yes
    type: string
    sql: ${TABLE}.brand_parent_id ;;
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
    label: "Marketing"
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
    description: "This is the date the ad incurred charges. Cost is associated to this date, as are all ad metrics."
  }

  dimension: marketing_ad_content {
    hidden: yes
    group_label: "Marketing Channels"
    label: "Ad Content"
    type: string
    sql: ${TABLE}.marketing_ad_content ;;
  }

  dimension: marketing_campaign_name {
    hidden: yes
    group_label: "Marketing Channels"
    label: "Campaign"
    type: string
    sql: ${TABLE}.marketing_campaign_name ;;
  }

  dimension: marketing_channel_grouping {
    hidden: yes
    group_label: "Marketing Channels"
    label: "Channel Grouping"
    type: string
    sql: ${TABLE}.marketing_channel_grouping ;;
  }

  dimension: marketing_source {
    hidden: no
    group_label: "Marketing Channels"
    label: "Source"
    type: string
    sql: ${TABLE}.marketing_source ;;
  }

  dimension: hard_bounce_count {
    hidden: yes
    type: number
    sql: ${TABLE}.hard_bounce_count ;;
  }

  measure: hard_bounce_count_total {
    hidden: yes
    group_label: "Ad Metrics"
    label: "Hard Bounces"
    type: sum
    sql: ${hard_bounce_count} ;;
    description: "Use this field to see how many hard bounces an Ad tracked."
  }

  dimension: marketing_impressions {
    hidden: yes
    type: number
    sql: ${TABLE}.marketing_impressions ;;
  }

  measure: marketing_impressions_total {
    hidden: yes
    group_label: "Ad Metrics"
    label: "Impressions"
    type: sum
    sql: ${marketing_impressions} ;;
    description: "Use this field to measure how many impressions an Ad received."
  }

  # Impressions per Click

  measure: impressions_per_click {
    hidden: yes
    group_label: "Ad Metrics"
    label: "Impressions per Click"
    value_format_name: decimal_2
    type: number
    sql: 1.0 * ${marketing_impressions_total} / NULLIF(${marketing_clicks_total}, 0) ;;
    description: "Use this field to analyze how effective impressions are at procuring clicks."
  }

  # Impressions per User

  measure: impressions_per_visitor {
    hidden: yes
    group_label: "Ad Metrics"
    label: "Impressions per User"
    value_format_name: decimal_2
    type: number
    sql: 1.0 * ${marketing_impressions_total} / NULLIF(${visitor_count_total}, 0) ;;
    description: "Use this field to analyze how effective impressions are at procuring visistors to the site."
  }

  # Impressions per Page View

  measure: impressions_per_page_view{
    hidden: yes
    group_label: "Ad Metrics"
    label: "Impressions per Page View"
    value_format_name: decimal_2
    type: number
    sql: 1.0 * ${marketing_impressions_total} / NULLIF(${page_views_total}, 0) ;;
    description: "Use this field to analyze how effective impressions are at procuring page views on the site."
  }

  # Impressions per Session

  measure: impressions_per_session{
    hidden: yes
    group_label: "Ad Metrics"
    label: "Impressions per Session"
    value_format_name: decimal_2
    type: number
    sql: 1.0 * ${marketing_impressions_total} / NULLIF(${session_count_total}, 0) ;;
    description: "Use this field to analyze how effective impressions are at procuring sessions."
  }

  measure: impressions_per_new_order_count{
    hidden: yes
    group_label: "Ad Metrics"
    label: "Impressions per New Customer Order"
    type: number
    value_format_name: decimal_2
    sql: 1.0 * ${marketing_impressions_total} / NULLIF(${new_order_count_total}, 0) ;;
    description: "Use this field to see how many total impressions convert to new customer orders. Please note, this is total impressions (impressions for both new and existing customers), not just impressions on NEW customers."
  }

  measure: impressions_per_existing_order_count{
    hidden: yes
    group_label: "Ad Metrics"
    label: "Impressions per Returning Customer Order"
    type: number
    value_format_name: decimal_2
    sql: 1.0 * ${marketing_impressions_total} / NULLIF(${existing_order_count_total}, 0) ;;
    description: "Use this field to see how many total impressions convert to existing customer orders. Please note, this is total impressions (impressions for both new and existing customers), not just impressions on EXISTING customers."
  }

  measure: impressions_per_new_existing_order_count{
    hidden: yes
    group_label: "Ad Metrics"
    label: "Impressions per Total Customer Order"
    type: number
    value_format_name: decimal_2
    sql: 1.0 * ${marketing_impressions_total} / NULLIF(${new_existing_order_count_total}, 0) ;;
    description: "Use this field to see how many total impressions convert to new and existing customer orders."
  }

  dimension: marketing_clicks {
    hidden: yes
    type: number
    sql: ${TABLE}.marketing_clicks ;;
  }

  measure: marketing_clicks_total {
    hidden: yes
    group_label: "Ad Metrics"
    label: "Clicks"
    type: sum
    sql: ${marketing_clicks} ;;
    description: "Use this field to analyze how many Clicks an Ad received."
  }

  # Clicks Per Session

  measure: clicks_per_session{
    hidden: yes
    group_label: "Ad Metrics"
    label: "Clicks per Session"
    value_format_name: decimal_2
    type: number
    sql: 1.0 * ${marketing_clicks_total} / NULLIF(${session_count_total}, 0) ;;
    description: "Use this field to analyze how effective clicks are at producing sessions."
  }

  # Clicks Per Page Views

  measure: clicks_per_page_view{
    hidden: yes
    group_label: "Ad Metrics"
    label: "Clicks per Page View"
    value_format_name: decimal_2
    type: number
    sql: 1.0 * ${marketing_clicks_total} / NULLIF(${page_views_total}, 0) ;;
    description: "Use this field to analyze how effective clicks are at producing page views."
  }

  # Clicks Per Visitors

  measure: clicks_per_visitor{
    hidden: yes
    group_label: "Ad Metrics"
    label: "Clicks per User"
    value_format_name: decimal_2
    type: number
    sql: 1.0 * ${marketing_clicks_total} / NULLIF(${visitor_count_total}, 0) ;;
    description: "Use this field to analyze how effective clicks are at producing visitors."
  }

  measure: clicks_per_new_order_count{
    hidden: yes
    group_label: "Ad Metrics"
    label: "Clicks per New Customer Order"
    type: number
    value_format_name: decimal_2
    sql: 1.0 * ${marketing_clicks_total} / NULLIF(${new_order_count_total}, 0) ;;
    description: "Use this field to see how many total clicks convert to new customer orders. Please note, this is total clicks (clicks for both new and existing customers), not just clicks on NEW customers."
  }

  measure: clicks_per_existing_order_count{
    hidden: yes
    group_label: "Ad Metrics"
    label: "Clicks per Returning Customer Order"
    type: number
    value_format_name: decimal_2
    sql: 1.0 * ${marketing_clicks_total} / NULLIF(${existing_order_count_total}, 0) ;;
    description: "Use this field to see how many total clicks convert to existing customer orders. Please note, this is total clicks (clicks for both new and existing customers), not just clicks on EXISTING customers."
  }

  measure: clicks_per_new_existing_order_count{
    hidden: yes
    group_label: "Ad Metrics"
    label: "Clicks per Total Customer Order"
    type: number
    value_format_name: decimal_2
    sql: 1.0 * ${marketing_clicks_total} / NULLIF(${new_existing_order_count_total}, 0) ;;
    description: "Use this field to see how many total clicks convert to new and existing customer orders."
  }

  dimension: page_views {
    hidden: yes
    type: number
    sql: ${TABLE}.page_views ;;
  }

  measure: page_views_total {
    hidden: yes
    group_label: "Ad Metrics"
    label: "Page Views"
    type: sum
    sql: ${page_views} ;;
  }

  measure: page_views_per_new_order_count{
    hidden: yes
    group_label: "Ad Metrics"
    label: "Page Views per New Customer Order"
    type: number
    value_format_name: decimal_2
    sql: 1.0 * ${page_views_total} / NULLIF(${new_order_count_total}, 0) ;;
  }

  measure: page_views_per_existing_order_count{
    hidden: yes
    group_label: "Ad Metrics"
    label: "Page Views per Returning Customer Order"
    type: number
    value_format_name: decimal_2
    sql: 1.0 * ${page_views_total} / NULLIF(${existing_order_count_total}, 0) ;;
  }

  measure: page_views_per_new_existing_order_count{
    hidden: yes
    group_label: "Ad Metrics"
    label: "Page Views per Total Customer Order"
    type: number
    value_format_name: decimal_2
    sql: 1.0 * ${page_views_total} / NULLIF(${new_existing_order_count_total}, 0) ;;
    description: "Use this field to see how frequently page views convert to new and existing customer orders."
  }

  dimension: session_count {
    hidden: yes
    type: number
    sql: ${TABLE}.session_count ;;
  }

  measure: session_count_total {
    hidden: yes
    group_label: "Ad Metrics"
    label: "Sessions"
    type: sum
    sql: ${session_count} ;;
  }

  measure: sessions_per_new_order_count{
    hidden: yes
    group_label: "Ad Metrics"
    label: "Sessions per New Customer Order"
    type: number
    value_format_name: decimal_2
    sql: 1.0 * ${session_count_total} / NULLIF(${new_order_count_total}, 0) ;;
  }

  measure: sessions_views_per_existing_order_count{
    hidden: yes
    group_label: "Ad Metrics"
    label: "Sessions per Returning Customer Order"
    type: number
    value_format_name: decimal_2
    sql: 1.0 * ${session_count_total} / NULLIF(${existing_order_count_total}, 0) ;;
  }

  measure: sessions_views_per_new_existing_order_count{
    hidden: yes
    group_label: "Ad Metrics"
    label: "Sessions per Total Customer Order"
    type: number
    value_format_name: decimal_2
    sql: 1.0 * ${session_count_total} / NULLIF(${new_existing_order_count_total}, 0) ;;
    description: "Use this field to see how frequently sessions convert to new and existing customer orders."
  }

  dimension: visitor_count {
    hidden: yes
    type: number
    sql: ${TABLE}.visitor_count ;;
  }

  measure: visitor_count_total {
    hidden: no
    group_label: "Ad Metrics"
    label: "Users"
    type: sum
    sql: ${visitor_count} ;;
  }

  measure: visitors_per_new_order_count{
    hidden: yes
    group_label: "Ad Metrics"
    label: "Users per New Customer Order"
    type: number
    value_format_name: decimal_2
    sql: 1.0 * ${visitor_count_total} / NULLIF(${new_order_count_total}, 0) ;;
  }

  measure: visitors_views_per_existing_order_count{
    hidden: yes
    group_label: "Ad Metrics"
    label: "Users per Returning Customer Order"
    type: number
    value_format_name: decimal_2
    sql: 1.0 * ${visitor_count_total} / NULLIF(${existing_order_count_total}, 0) ;;
  }

  measure: visitors_views_per_new_existing_order_count{
    hidden: yes
    group_label: "Ad Metrics"
    label: "Users per Total Customer Order"
    type: number
    value_format_name: decimal_2
    sql: 1.0 * ${visitor_count_total} / NULLIF(${new_existing_order_count_total}, 0) ;;
    description: "Use this field to see how frequently visitors convert to new and existing customer orders."
  }

  # NEW METRICS

  dimension: new_customer_count {
    hidden: yes
    type: number
    sql: ${TABLE}.new_customer_count ;;
  }

  measure: new_customer_count_total {
    hidden: yes
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
    hidden: yes
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
    hidden: yes
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
    hidden: yes
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
    hidden: yes
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
    hidden: yes
    group_label: "New Customers"
    label: "New | Sales"
    type: sum
    value_format_name: usd
    sql: ${new_total_sales_b4_returns} ;;
  }

  dimension: new_net_sales_b4_returns {
    hidden: yes
    type: number
    sql: ${TABLE}.new_net_sales_b4_returns ;;
  }

  measure: new_net_sales_b4_returns_total {
    hidden: yes
    group_label: "New Customers"
    label: "New | Net Sales"
    type: sum
    value_format_name: usd
    sql: ${new_net_sales_b4_returns} + ${new_shipping} ;;
  }

  dimension: new_shipping {
    hidden: yes
    type: number
    sql: ${TABLE}.new_shipping ;;
  }

  measure: new_shipping_total {
    hidden: yes
    group_label: "New Customers"
    label: "New | Shipping"
    type: sum
    value_format_name: usd
    sql: ${new_shipping} ;;
  }

  measure: new_AOV {
    hidden: yes
    group_label: "New Customers"
    label: "New | Average Order Value"
    type: number
    value_format_name: usd
    sql: 1.0 * ${new_net_sales_b4_returns_total} / NULLIF(${new_order_count_total},0) ;;
  }

  measure: new_conversions {
    hidden: yes
    group_label: "New Customers"
    label: "New | Conversion Rate"
    type: number
    value_format_name: percent_2
    sql: 1.0 * ${new_order_count_total} / NULLIF(${visitor_count_total},0) ;;
  }

  measure: new_variable_ad_expense_as_percent_of_sales {
    hidden: yes
    group_label: "New Customers"
    label: "New | VADX % of Sales"
    type: number
    value_format_name: percent_2
    sql: 1.0 * ${marketing_spend_total} / NULLIF(${new_net_sales_b4_returns_total},0) ;;
  }

  # EXISTING METRICS

  dimension: existing_customer_count {
    hidden: yes
    type: number
    sql: ${TABLE}.existing_customer_count ;;
  }

  measure: existing_customer_count_total {
    hidden: yes
    group_label: "Returning Customers"
    label: "Returning | Customer Count"
    type: sum
    sql: ${existing_customer_count} ;;
  }

  dimension: existing_item_count {
    hidden: yes
    type: number
    sql: ${TABLE}.existing_item_count ;;
  }

  measure: existing_item_count_total {
    hidden: yes
    group_label: "Returning Customers"
    label: "Returning | Item Count"
    type: sum
    sql: ${existing_item_count} ;;
  }

  dimension: existing_order_count {
    hidden: yes
    type: number
    sql: ${TABLE}.existing_order_count ;;
  }

  measure: existing_order_count_total {
    hidden: yes
    group_label: "Returning Customers"
    label: "Returning | Order Count"
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
    hidden: yes
    group_label: "Returning Customers"
    label: "Returning | COGS"
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
    hidden: yes
    group_label: "Returning Customers"
    label: "Returning | Margin Dollars"
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
    hidden: yes
    group_label: "Returning Customers"
    label: "Returning | Sales"
    type: sum
    value_format_name: usd
    sql: ${existing_total_sales_b4_returns} ;;
  }

  dimension: existing_net_sales_b4_returns {
    hidden: yes
    type: number
    sql: ${TABLE}.existing_net_sales_b4_returns ;;
  }

  measure: existing_net_sales_b4_returns_total {
    hidden: yes
    group_label: "Returning Customers"
    label: "Returning | Net Sales"
    type: sum
    value_format_name: usd
    sql: ${existing_net_sales_b4_returns} + ${existing_shipping};;
  }

  dimension: existing_shipping {
    hidden: yes
    type: number
    sql: ${TABLE}.existing_shipping ;;
  }

  measure: existing_shipping_total {
    hidden: yes
    group_label: "Returning Customers"
    label: "Returning | Shipping"
    type: sum
    value_format_name: usd
    sql: ${existing_shipping} ;;
  }

  measure: existing_AOV {
    hidden: yes
    group_label: "Returning Customers"
    label: "Returning | Average Order Value"
    type: number
    value_format_name: usd
    sql: 1.0 * ${existing_net_sales_b4_returns_total} / NULLIF(${existing_order_count_total},0) ;;
  }

  measure: existing_conversions {
    hidden: yes
    group_label: "Returning Customers"
    label: "Returning | Conversion Rate"
    type: number
    value_format_name: percent_2
    sql: 1.0 * ${existing_order_count_total} / NULLIF(${visitor_count_total},0) ;;
  }

  measure: existing_variable_ad_expense_as_percent_of_sales {
    hidden: yes
    group_label: "Returning Customers"
    label: "Returning | VADX % of Sales"
    type: number
    value_format_name: percent_2
    sql: 1.0 * ${marketing_spend_total} / NULLIF(${existing_net_sales_b4_returns_total},0) ;;
  }

  # TOTAL METRICS

  dimension: new_existing_customer_count {
    hidden: yes
    type: number
    sql: ${TABLE}.total_customer_count ;;
  }

  measure: new_existing_customer_count_total {
    hidden: yes
    group_label: "All Customers"
    label: "Customer Count"
    type: sum
    sql: ${new_existing_customer_count} ;;
  }

  dimension: new_existing_item_count {
    hidden: yes
    type: number
    sql: ${TABLE}.total_item_count ;;
  }

  measure: new_existing_item_count_total {
    hidden: yes
    group_label: "All Customers"
    label: "Item Count"
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
    label: "Order Count"
    type: sum
    sql: ${new_existing_order_count} ;;
    description: "Use this field to get a count of all customers orders."
  }


# TOTAL DOLLAR METRICS

  dimension: new_existing_cogs {
    hidden: yes
    type: number
    sql: ${TABLE}.total_cogs ;;
  }

  measure: new_existing_cogs_total {
    hidden: yes
    group_label: "All Customers"
    label: "COGS"
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
    hidden: yes
    group_label: "All Customers"
    label: "Margin Dollars"
    type: sum
    value_format_name: usd
    sql: ${new_existing_margin_dollars} ;;
  }

  dimension: new_existing_total_sales_b4_returns {
    hidden: yes
    type: number
    sql: ${TABLE}.total_total_sales_b4_returns ;;
  }

  measure: new_existing_total_sales_b4_returns_total {
    hidden: yes
    group_label: "All Customers"
    label: "Sales"
    type: sum
    value_format_name: usd
    sql: ${new_existing_total_sales_b4_returns} ;;
  }

  dimension: new_existing_net_sales_b4_returns {
    hidden: yes
    type: number
    sql: ${TABLE}.total_net_sales_b4_returns ;;
  }

  measure: new_existing_net_sales_b4_returns_total {
    group_label: "All Customers"
    label: "Net Sales"
    type: sum
    value_format_name: usd
    sql: ISNULL(${new_existing_net_sales_b4_returns},0) + ISNULL(${new_existing_shipping},0) ;;
    description: "Use this field to get the Net Sales (ordered Net Sales) for all customers."
  }

  dimension: new_existing_shipping {
    hidden: yes
    type: number
    sql: ${TABLE}.total_shipping ;;
  }

  measure: new_existing_shipping_total {
    hidden: yes
    group_label: "All Customers"
    label: "Shipping"
    type: sum
    value_format_name: usd
    sql: ${new_existing_shipping} ;;
  }

  measure: new_existing_AOV {
    group_label: "All Customers"
    label: "Average Order Value"
    type: number
    value_format_name: usd
    sql: 1.0 * ${new_existing_net_sales_b4_returns_total} / NULLIF(${new_existing_order_count_total},0) ;;
    description: "Use this field to determine the overall Average Order Value of all customers."
  }

  measure: new_existing_conversions {
    group_label: "All Customers"
    label: "Conversion Rate"
    type: number
    value_format_name: percent_2
    sql: 1.0 * ${new_existing_order_count_total} / NULLIF(${visitor_count_total},0) ;;
    description: "Use this field to Orders / Visitors for all customers."
  }

  measure: new_existing_variable_ad_expense_as_percent_of_sales {
    group_label: "All Customers"
    label: "VADX % of Sales"
    type: number
    value_format_name: percent_2
    sql: 1.0 * ${marketing_spend_total} / NULLIF(${new_existing_net_sales_b4_returns_total},0) ;;
    description: "Use this field to determine actual marketing costs as a percentage of total sales."
  }



# MAY NEED TO CHANGE THESE TO FILTERS
  dimension: year_to_date {
    group_label: "Date Filters"
    type:  yesno
    label: "Year to Date"
    sql: ${date_date} <= GETDATE() - 1
      AND YEAR(${date_date}) = YEAR(GETDATE());;
    description: "Use this filter to get data for Year to Date"
  }

# MAY NEED TO CHANGE THESE TO FILTERS
  dimension: month_to_date {
    group_label: "Date Filters"
    type:  yesno
    label: "Month to Date"
    sql: ${date_date} <= GETDATE() - 1
      AND YEAR(${date_date}) = YEAR(GETDATE())
      AND MONTH(${date_date}) = MONTH(GETDATE());;
    description: "Use this filter to get data for Month to Date"
  }

  dimension: order_date_last_year {
    group_label: "Date Filters"
    type:  yesno
    label: "Last Year"
    sql: ${date_date} <= GETDATE() - 1
      AND YEAR(${date_date}) = YEAR(GETDATE()) - 1;;
    description: "Use this filter to get data for Last Year."
  }

  dimension: order_date_last_year_month_to_date {
    group_label: "Date Filters"
    type:  yesno
    label: "Last Year Month to Date"
    sql: ${date_date} <= GETDATE() - 1
      AND YEAR(${date_date}) = YEAR(GETDATE()) - 1
      AND MONTH(${date_date}) = MONTH(GETDATE())
      AND DAY(${date_date}) <= DAY(GETDATE()) - 1;;
    description: "Use this filter to get data for Last Year Month to Date"
  }

  # ROAS

  # measure: existing_roas_avg {
  #   group_label: "ROAS"
  #   label: "Returning | ROAS Average"
  #   type: average
  #   value_format_name: usd
  #   sql: AVG(${existing_total_sales_b4_returns}) / AVG(${marketing_spend}) ;;
  # }

  # measure: new_roas_avg {
  #   group_label: "ROAS"
  #   label: "New | ROAS Average"
  #   type: average
  #   value_format_name: usd
  #   # sql: CASE
  #   sql: AVG(${new_total_sales_b4_returns}) / AVG(${marketing_spend}) ;;
  # }

#   measure: new_existing_roas_avg {
#     group_label: "ROAS"
#     label: "New & Returning | ROAS Average"
#     type: average
#     value_format_name: usd
#     sql: AVG(${new_existing_total_sales_b4_returns}) / AVG(${marketing_spend}) ;;
# }

  measure: existing_roas_sum {
    hidden: yes
    group_label: "Returning Customers"
    label: "Returning | ROAS"
    type: number
    value_format_name: decimal_2
    sql: ${existing_net_sales_b4_returns_total} / NULLIF(${marketing_spend_total}, 0) ;;
  }

  measure: new_roas_sum {
    hidden: yes
    group_label: "New Customers"
    label: "New | ROAS"
    type: number
    value_format_name: decimal_2
    sql: ${new_net_sales_b4_returns_total} / NULLIF(${marketing_spend_total}, 0) ;;
  }

  measure: new_existing_roas_sum {
    group_label: "All Customers"
    label: "ROAS"
    type: number
    value_format_name: decimal_2
    sql: ${new_existing_net_sales_b4_returns_total} / NULLIF(${marketing_spend_total}, 0) ;;
    description: "Use this field to get the ROAS for all customers (ROAS is calculated using Net Sales as of the Ordered Date, not as of Shipped Date)"
  }

  measure: new_existing_roas_sum_7_day_rolling_average {
    group_label: "All Customers"
    label: "7 Day Rolling ROAS"
    type: number
    value_format_name: decimal_2
    sql: mean(offset_list(${new_existing_roas_sum},-1,7)) ;;
    description: "Use this field to get the ROAS for all customers (ROAS is calculated using Net Sales as of the Ordered Date, not as of Shipped Date)"
  }

  # MARKETING SPEND METRICS

  dimension: marketing_spend {
    hidden: yes
    type: number
    sql: ${TABLE}.marketing_spend ;;
  }

  measure: marketing_spend_total {
    group_label: "Ad Cost Metrics"
    label: "Ad Cost"
    description: "Use for marketing costs. Validated with Heather on 3/11/2021. Make sure to include the final day."
    type: sum
    value_format_name: usd
    sql: ${marketing_spend} ;;
  }

  measure: new_existing_spend_per_order_sum {
    hidden: yes
    group_label: "Ad Cost Metrics"
    label: "Ad Cost / Order Total"
    type: number
    value_format_name: usd
    # sql: CASE
    # WHEN ${new_existing_order_count} <> 0 THEN ${marketing_spend} / ${new_existing_order_count}
    # ELSE ${marketing_spend}
    # END;;
    sql: ${marketing_spend_total} / NULLIF(${new_existing_order_count_total},0) ;;
  }

  measure: new_existing_spend_per_customer_sum {
    hidden: yes
    group_label: "Ad Cost Metrics"
    label: "Ad Cost / Customer Total"
    type: number
    value_format_name: usd
    # sql: CASE
    # WHEN ${new_existing_customer_count} <> 0 THEN ${marketing_spend} / ${new_existing_customer_count}
    # ELSE ${marketing_spend}
    # END;;
    sql: ${marketing_spend_total} / NULLIF(${new_existing_customer_count_total},0) ;;
  }

  measure: new_existing_spend_per_item_sum {
    hidden: yes
    group_label: "Ad Cost Metrics"
    label: "Ad Cost / Item Total"
    type: number
    value_format_name: usd
    # sql: CASE
    # WHEN ${new_existing_item_count} <> 0 THEN ${marketing_spend} / ${new_existing_item_count}
    # ELSE ${marketing_spend}
    # END;;
    sql: ${marketing_spend_total} / NULLIF(${new_existing_item_count_total},0) ;;
  }





  # measure: new_existing_spend_per_order_avg {
  #   group_label: "Marketing Spend Metrics"
  #   label: "New & Returning | Dollars / Order Average"
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
  #   label: "New & Returning | Dollars / Customer Average"
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
  #   label: "New & Returning | Dollars / Item Average"
  #   type: number
  #   value_format_name: usd
  #   # sql: CASE
  #   # WHEN ${new_existing_item_count} <> 0 THEN ${marketing_spend} / ${new_existing_item_count}
  #   # ELSE ${marketing_spend}
  #   # END;;
  #   sql: AVG(${marketing_spend}) / AVG(${new_existing_item_count}) ;;
  # }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [brand_parent_name, marketing_campaign_name]
  }

}
