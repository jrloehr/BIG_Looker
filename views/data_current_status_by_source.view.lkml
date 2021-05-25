view: data_current_status_by_source {
  sql_table_name: edw.DataCurrentStatusBySource ;;

  dimension_group: data_as_of {
    label: "Sync Time"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year,
      month_name,
      month_num
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Data_as_of ;;
    hidden: no
    description: "Use this field to group/filter/compare by Date/Time of Sync. Select the time-frame you'd like to use."
  }

  dimension: source_object {
    type: string
    sql: ${TABLE}.SourceObject ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
