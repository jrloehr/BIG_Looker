# view: dim_parent_company {
#   sql_table_name: edw.DimParentCompany ;;

#   dimension: city {
#     label: "Parent Company City"
#     type: string
#     sql: ${TABLE}.City ;;
#   }

#   dimension: country {
#     type: string
#     label: "Parent Company Country"
#     map_layer_name: countries
#     sql: ${TABLE}.Country ;;
#   }

#   dimension: subsidiary_id {
#     # hidden: yes
#     type: number
#     sql: ${TABLE}.subsidiary_id ;;
#   }

#   dimension: subsidiary_name {
#     label: "Parent Company Name"
#     type: string
#     sql: ${TABLE}.Subsidiary_Name ;;
#   }

#   dimension: subsidiary_state {
#     label: "Parent Company State"
#     type: string
#     sql: ${TABLE}.Subsidiary_State ;;
#   }

#   dimension: zip_code {
#     label: "Parent Company Zip Code"
#     type: zipcode
#     sql: ${TABLE}.ZipCode ;;
#   }

#   measure: count {
#     type: count
#     drill_fields: [subsidiary_name]
#   }
# }
