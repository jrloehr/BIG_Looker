view: dim_sales_channel {
  sql_table_name: dbo.DimSalesChannel ;;

  dimension: customer_type_id {
    # hidden: yes
    type: number
    sql: ${TABLE}.customer_type_id ;;
  }

  dimension: sales_channel_name {
    label: "Sales Channel"
    type: string
    sql: ${TABLE}.SalesChannelName ;;
  }

  measure: count {
    type: count
    drill_fields: [sales_channel_name]
  }
}
