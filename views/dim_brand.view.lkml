view: dim_brand {
  sql_table_name: dbo.DimBrand ;;

  dimension: brand_city {
    type: string
    sql: ${TABLE}.Brand_City ;;
  }

  dimension: brand_country {
    type: string
    sql: ${TABLE}.Brand_Country ;;
  }

  dimension: brand_id {
    type: number
    sql: ${TABLE}.Brand_id ;;
  }

  dimension: brand_name {
    type: string
    sql: ${TABLE}.Brand_Name ;;
  }

  dimension: brand_parent_name {
    type: string
    sql: ${TABLE}.Brand_Parent_Name ;;
  }

  dimension: brand_state {
    type: string
    sql: ${TABLE}.Brand_State ;;
  }

  dimension: brand_zip_code {
    type: string
    sql: ${TABLE}.Brand_ZipCode ;;
  }

  dimension: subsidiary_id {
    type: number
    sql: ${TABLE}.Subsidiary_id ;;
  }

  dimension: subsidiary_name {
    type: string
    sql: ${TABLE}.Subsidiary_Name ;;
  }

  measure: count {
    type: count
    drill_fields: [brand_name, brand_parent_name, subsidiary_name]
  }
}