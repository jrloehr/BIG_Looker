# view: dim_date {
#   sql_table_name: edw.DimDate ;;

#   dimension_group: date {
#     type: time
#     timeframes: [
#       raw,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     convert_tz: no
#     datatype: date
#     sql: ${TABLE}.Date ;;
#   }

#   dimension: month {
#     type: number
#     sql: ${TABLE}.Month ;;
#   }

#   dimension: week {
#     type: number
#     sql: ${TABLE}.Week ;;
#   }

#   dimension: year {
#     type: number
#     sql: ${TABLE}.Year ;;
#   }

#   measure: count {
#     type: count
#     drill_fields: []
#   }
# }
