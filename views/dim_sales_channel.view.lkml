view: dim_sales_channel {
  sql_table_name: edw.DimSalesChannel ;;

  dimension: customer_type_id {
    hidden: yes
    type: number
    sql: ${TABLE}.customer_type_id ;;
  }

  dimension: sales_channel_name {
    label: "Sales Channel"
    type: string
    sql: ${TABLE}.SalesChannelName ;;
    description: "This field is the NetSuite field 'Customer Type Name'. It has been re-labeled to more accurately convey its meaning."
  }

  measure: count {
    type: count
    drill_fields: [sales_channel_name]
  }
}
