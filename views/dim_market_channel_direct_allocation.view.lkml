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

  dimension: marketing_channel_hierarchy {
    label_from_parameter: marketing_channel_hierarchy_types
    sql:  CASE
      WHEN {% parameter marketing_channel_hierarchy_types %} = '5 Keyword'
        THEN ${marketing_keyword}
      WHEN {% parameter marketing_channel_hierarchy_types %} = '4 Ad Content'
        THEN ${marketing_ad_content}
      WHEN {% parameter marketing_channel_hierarchy_types %} = '3 Campaign'
        THEN ${marketing_campaign}
      WHEN {% parameter marketing_channel_hierarchy_types %} = '2 Source Medium'
        THEN ${marketing_source_medium}
      WHEN {% parameter marketing_channel_hierarchy_types %} = '1 Grouping'
        THEN ${marketing_channel_grouping}
      ELSE NULL
    END ;;
  }

  parameter: marketing_channel_hierarchy_types {
    type: string
    allowed_value: {value:"Ad Content"}
    allowed_value: {value:"Keyword"}
    allowed_value: {value:"Campaign"}
    allowed_value: {value:"Source Medium"}
    allowed_value: {value:"Grouping"}
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
