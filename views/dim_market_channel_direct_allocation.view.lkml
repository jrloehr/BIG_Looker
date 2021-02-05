view: dim_market_channel_direct_allocation {
  sql_table_name: dbo.DimMarketChannelDirectAllocation ;;

  dimension_group: date_created {
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
    sql: ${TABLE}.date_created ;;
  }

  dimension_group: last_activity {
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
    sql: ${TABLE}.last_activity ;;
  }

  dimension: marketing_channel_id {
    group_label: "Marketing Channel"
    type: number
    sql: ${TABLE}.Marketing_ChannelId ;;
  }

  dimension: marketing_channel_grouping {
    group_label: "Marketing Channel"
    type: string
    sql: ${TABLE}.Marketing_Channel_Grouping ;;
  }

  dimension: marketing_source_medium {
    group_label: "Marketing Channel"
    type: string
    sql: ${TABLE}.Marketing_Source_Medium ;;
  }

  dimension: marketing_campaign {
    group_label: "Marketing Channel"
    type: string
    sql: ${TABLE}.Marketing_Campaign ;;
  }

  dimension: marketing_ad_content {
    group_label: "Marketing Channel"
    type: string
    sql: ${TABLE}.Marketing_Ad_Content ;;
  }

  dimension: marketing_keyword {
    group_label: "Marketing Channel"
    type: string
    sql: ${TABLE}.Marketing_Keyword ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
