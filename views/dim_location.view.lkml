view: dim_location {
  sql_table_name: dbo.DimLocation ;;

  dimension: city {
    label: "City"
    type: string
    sql: ${TABLE}.City ;;
  }

  dimension: country {
    label: "Country"
    type: string
    map_layer_name: countries
    sql: ${TABLE}.Country ;;
  }

  dimension: location_id {
    primary_key: yes
    label: "Location ID"
    type: number
    sql: ${TABLE}.Location_id ;;
  }

  dimension: location_name {
    label: "Location Name"
    type: string
    sql: ${TABLE}.Location_Name ;;
  }

  dimension: parent_location_name {
    label: "Brand Name"
    type: string
    sql: ${TABLE}.Parent_Location_Name ;;
  }

  dimension: slocation_state {
    label: "Brand State"
    type: string
    sql: ${TABLE}.SLocation_State ;;
  }

  dimension: zip_code {
    label: "Zip Code"
    type: zipcode
    sql: ${TABLE}.ZipCode ;;
  }

  measure: count {
    type: count
    drill_fields: [location_name, parent_location_name]
  }
}
