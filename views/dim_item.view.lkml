view: dim_item {
  sql_table_name: dbo.DimItem ;;

  dimension: item_status_id {
    type: number
    sql: ${TABLE}.item_status_id ;;
  }


  dimension: brand {
    label: "Item Brand"
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: class_id {
    type: number
    sql: ${TABLE}.Class_id ;;
  }

  dimension: color_category {
    group_label: "Color Attributes"
    type: string
    sql: ${TABLE}.color_category ;;
  }

  dimension: color_code_id {
    group_label: "Color Attributes"
    type: number
    sql: ${TABLE}.color_code_id ;;
  }

  dimension: color_name_id {
    group_label: "Color Attributes"
    type: number
    sql: ${TABLE}.color_name_id ;;
  }

  dimension: color_process {
    group_label: "Color Attributes"
    type: string
    sql: ${TABLE}.color_process ;;
  }

  dimension: color_process_big_id {
    group_label: "Color Attributes"
    type: number
    sql: ${TABLE}.color_process_big_id ;;
  }

  dimension: color_processes {
    group_label: "Color Attributes"
    type: string
    sql: ${TABLE}.color_processes ;;
  }

  dimension: hair_color {
    group_label: "Color Attributes"
    type: string
    sql: ${TABLE}.hair_color ;;
  }


  dimension: band_type {
    type: string
    sql: ${TABLE}.band_type ;;
  }

  dimension: consumption_unit_id {
    type: number
    sql: ${TABLE}.consumption_unit_id ;;
  }




  dimension: created {
    group_label: "Product Dates"
    type: string
    sql: ${TABLE}.created ;;
  }

  dimension: date_last_modified {
    group_label: "Product Dates"
    type: string
    sql: ${TABLE}.date_last_modified ;;
  }

  dimension: expected_launch_date {
    group_label: "Product Dates"
    type: string
    sql: ${TABLE}.expected_launch_date ;;
  }


  dimension: displayname {
    group_label: "Product Naming"
    type: string
    sql: ${TABLE}.displayname ;;
  }

  dimension: full_name {
    group_label: "Product Naming"
    type: string
    sql: ${TABLE}.full_name ;;
  }

  dimension: item_full_name {
    group_label: "Product Naming"
    type: string
    sql: ${TABLE}.Item_Full_Name ;;
  }

  dimension: item_id {
    group_label: "Product Naming"
    type: number
    sql: ${TABLE}.item_id ;;
  }

  dimension: item_name {
    group_label: "Product Naming"
    type: string
    sql: ${TABLE}.Item_Name ;;
  }

  dimension: name {
    group_label: "Product Naming"
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: item_display_name {
    group_label: "Product Naming"
    type: string
    sql: ${TABLE}.Item_Display_Name ;;
  }


  dimension: width_cm {
    group_label: "Width Attributes"
    type: string
    sql: ${TABLE}.width_cm ;;
  }

  dimension: width_of_hair {
    group_label: "Width Attributes"
    type: string
    sql: ${TABLE}.width_of_hair ;;
  }


  dimension: gram_weight {
    group_label: "Weight Attributes"
    type: number
    sql: ${TABLE}.gram_weight ;;
  }

  dimension: weight {
    group_label: "Weight Attributes"
    type: number
    sql: ${TABLE}.weight ;;
  }

  dimension: weight_count {
    group_label: "Weight Attributes"
    type: string
    sql: ${TABLE}.weight_count ;;
  }

  dimension: weight_in_user_defined_unit {
    group_label: "Weight Attributes"
    type: number
    sql: ${TABLE}.weight_in_user_defined_unit ;;
  }

  dimension: weight_unit_index {
    group_label: "Weight Attributes"
    type: number
    sql: ${TABLE}.weight_unit_index ;;
  }


  dimension: actual_length {
    group_label: "Length Attributes"
    type: string
    sql: ${TABLE}.actual_length ;;
  }

  dimension: hair_ext_length {
    group_label: "Length Attributes"
    type: string
    sql: ${TABLE}.hair_ext_length ;;
  }

  dimension: hair_length {
    group_label: "Length Attributes"
    type: string
    sql: ${TABLE}.hair_length ;;
  }

  dimension: length_cm {
    group_label: "Length Attributes"
    type: string
    sql: ${TABLE}.length_cm ;;
  }



  dimension: hair_texture_id {
    type: number
    sql: ${TABLE}.hair_texture_id ;;
  }




  dimension: image_url {
    type: string
    sql: ${TABLE}.image_url ;;
  }

  dimension: income_account_id {
    type: number
    sql: ${TABLE}.income_account_id ;;
  }




  dimension: hair_type_id {
    type: number
    sql: ${TABLE}.hair_type_id ;;
  }

  dimension: item_type_id {
    type: number
    sql: ${TABLE}.item_type_id ;;
  }

  dimension: type_name {
    type: string
    sql: ${TABLE}.type_name ;;
  }



  dimension: location_id {
    type: number
    sql: ${TABLE}.location_id ;;
  }

  dimension: merch_type {
    type: string
    sql: ${TABLE}.Merch_type ;;
  }



  dimension: product_category {
    type: string
    sql: ${TABLE}.ProductCategory ;;
  }

  dimension: product_category_parent {
    type: string
    sql: ${TABLE}.ProductCategoryParent ;;
  }



  dimension: qb_id {
    type: string
    sql: ${TABLE}.qb_id ;;
  }

  dimension: qb_name_0 {
    type: string
    sql: ${TABLE}.qb_name_0 ;;
  }



  dimension: sale_unit_id {
    group_label: "Sales Attributes"
    type: number
    sql: ${TABLE}.sale_unit_id ;;
  }

  dimension: substringend {
    type: number
    sql: ${TABLE}.substringend ;;
  }

  dimension: sales_price {
    group_label: "Sales Attributes"
    type: string
    sql: ${TABLE}.SalesPrice ;;
  }

  dimension: totalvalue {
    group_label: "Sales Attributes"
    type: number
    sql: ${TABLE}.totalvalue ;;
  }

  dimension: salesdescription {
    group_label: "Sales Attributes"
    type: string
    sql: ${TABLE}.salesdescription ;;
  }


  dimension: cost_0 {
    group_label: "Manufacture Attributes"
    type: number
    sql: ${TABLE}.cost_0 ;;
  }

  dimension: country_of_manufacture {
    group_label: "Manufacture Attributes"
    type: string
    sql: ${TABLE}.country_of_manufacture ;;
  }

  dimension: vendor_id {
    group_label: "Manufacture Attributes"
    type: number
    sql: ${TABLE}.vendor_id ;;
  }

  dimension: vendorname {
    group_label: "Manufacture Attributes"
    type: string
    sql: ${TABLE}.vendorname ;;
  }





  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      item_name,
      item_display_name,
      item_full_name,
      displayname,
      full_name,
      name,
      type_name,
      vendorname
    ]
  }
}
