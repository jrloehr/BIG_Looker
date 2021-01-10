view: dim_location {
  sql_table_name: dbo.DimLocation ;;

  dimension: city {
    type: string
    sql: ${TABLE}.City ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.Country ;;
  }

  dimension: location_id {
    type: number
    sql: ${TABLE}.Location_id ;;
  }

  dimension: location_name {
    type: string
    sql: ${TABLE}.Location_Name ;;
  }

  dimension: parent_location_name {
    type: string
    sql: ${TABLE}.Parent_Location_Name ;;
  }

  dimension: slocation_state {
    type: string
    sql: ${TABLE}.SLocation_State ;;
  }

  dimension: zip_code {
    type: zipcode
    sql: ${TABLE}.ZipCode ;;
  }

  measure: count {
    type: count
    drill_fields: [location_name, parent_location_name]
  }
}
