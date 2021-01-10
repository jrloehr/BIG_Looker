view: dim_subsidiary {
  sql_table_name: dbo.DimSubsidiary ;;

  dimension: city {
    type: string
    sql: ${TABLE}.City ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.Country ;;
  }

  dimension: subsidiary_id {
    type: number
    sql: ${TABLE}.subsidiary_id ;;
  }

  dimension: subsidiary_name {
    type: string
    sql: ${TABLE}.Subsidiary_Name ;;
  }

  dimension: subsidiary_state {
    type: string
    sql: ${TABLE}.Subsidiary_State ;;
  }

  dimension: zip_code {
    type: zipcode
    sql: ${TABLE}.ZipCode ;;
  }

  measure: count {
    type: count
    drill_fields: [subsidiary_name]
  }
}
