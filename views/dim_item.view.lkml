view: dim_item {
  sql_table_name: edw.DimItem ;;

  dimension: item_status_id {
    hidden: no
    type: number
    sql: ${TABLE}.item_status_id ;;
  }

  dimension: item_hierarchy_id_1 {
    hidden: no
    type: number
    sql: ${TABLE}.prod_family_lvl__1_id ;;
  }

  dimension: item_hierarchy_id_2 {
    hidden: no
    type: number
    sql: ${TABLE}.prod_family_lvl__2_id ;;
  }

  dimension: item_hierarchy_id_3 {
    hidden: no
    type: number
    sql: ${TABLE}.prod_family_lvl__3_id ;;
  }

  dimension: item_hierarchy_id_4 {
    hidden: no
    type: number
    sql: ${TABLE}.prod_family_lvl__4_id ;;
  }

  dimension: item_hierarchy_name_1 {
    hidden: no
    type: string
    sql: ${TABLE}.prod_family_lvl__1_name ;;
  }

  dimension: item_hierarchy_name_2 {
    hidden: no
    type: string
    sql: ${TABLE}.prod_family_lvl__2_name ;;
  }

  dimension: item_hierarchy_name_3 {
    hidden: no
    type: string
    sql: ${TABLE}.prod_family_lvl__3_name ;;
  }

  dimension: item_hierarchy_name_4 {
    hidden: no
    type: string
    sql: ${TABLE}.prod_family_lvl__4_name ;;
  }

  dimension: product_family_hierarchy {
    hidden: no
    label_from_parameter: product_family_hierarchy_types
    sql:  CASE
      WHEN {% parameter product_family_hierarchy_types %} = '4 Ad Content'
        THEN ${item_hierarchy_name_4}
      WHEN {% parameter product_family_hierarchy_types %} = '3 Campaign'
        THEN ${item_hierarchy_name_3}
      WHEN {% parameter product_family_hierarchy_types %} = '2 Source Medium'
        THEN ${item_hierarchy_name_2}
      WHEN {% parameter product_family_hierarchy_types %} = '1 Grouping'
        THEN ${item_hierarchy_name_1}
      ELSE NULL
    END ;;
  }

  parameter: product_family_hierarchy_types {
    hidden: no
    type: string
    allowed_value: {value:"Ad Content"}
    allowed_value: {value:"Keyword"}
    allowed_value: {value:"Campaign"}
    allowed_value: {value:"Source Medium"}
    allowed_value: {value:"Grouping"}
  }



  dimension: brand {
    hidden: no
    label: "Item Brand"
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: class_id {
    hidden: no
    type: number
    sql: ${TABLE}.Class_id ;;
  }

  dimension: color_category {
    hidden: no
    group_label: "Color Attributes"
    type: string
    sql: ${TABLE}.color_category ;;
  }

  dimension: color_code_id {
    hidden: no
    group_label: "Color Attributes"
    type: number
    sql: ${TABLE}.color_code_id ;;
  }

  dimension: color_name_id {
    hidden: no
    group_label: "Color Attributes"
    type: number
    sql: ${TABLE}.color_name_id ;;
  }

  dimension: color_process {
    hidden: no
    group_label: "Color Attributes"
    type: string
    sql: ${TABLE}.color_process ;;
  }

  dimension: color_process_big_id {
    hidden: no
    group_label: "Color Attributes"
    type: number
    sql: ${TABLE}.color_process_big_id ;;
  }

  dimension: color_processes {
    hidden: no
    group_label: "Color Attributes"
    type: string
    sql: ${TABLE}.color_processes ;;
  }

  dimension: hair_color {
    hidden: no
    group_label: "Color Attributes"
    type: string
    sql: ${TABLE}.hair_color ;;
  }


  dimension: band_type {
    hidden: no
    type: string
    sql: ${TABLE}.band_type ;;
  }

  dimension: consumption_unit_id {
    hidden: no
    type: number
    sql: ${TABLE}.consumption_unit_id ;;
  }




  dimension: created {
    hidden: no
    group_label: "Product Dates"
    type: string
    sql: ${TABLE}.created ;;
  }

  dimension: date_last_modified {
    hidden: no
    group_label: "Product Dates"
    type: string
    sql: ${TABLE}.date_last_modified ;;
  }

  dimension: expected_launch_date {
    hidden: no
    group_label: "Product Dates"
    type: string
    sql: ${TABLE}.expected_launch_date ;;
  }


  dimension: displayname {
    hidden: no
    group_label: "Product Naming"
    type: string
    sql: ${TABLE}.displayname ;;
  }

  dimension: full_name {
    hidden: no
    group_label: "Product Naming"
    type: string
    sql: ${TABLE}.full_name ;;
  }

  dimension: item_full_name {
    hidden: no
    group_label: "Product Naming"
    type: string
    sql: ${TABLE}.Item_Full_Name ;;
  }

  dimension: item_id {
    hidden: no
    group_label: "Product Naming"
    type: number
    sql: ${TABLE}.item_id ;;
  }

  dimension: item_name {
    hidden: no
    group_label: "Product Naming"
    type: string
    sql: ${TABLE}.Item_Name ;;
  }

  dimension: name {
    hidden: no
    group_label: "Product Naming"
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: item_display_name {
    hidden: no
    group_label: "Product Naming"
    type: string
    sql: ${TABLE}.Item_Display_Name ;;
  }


  dimension: width_cm {
    hidden: no
    group_label: "Width Attributes"
    type: string
    sql: ${TABLE}.width_cm ;;
  }

  dimension: width_of_hair {
    hidden: no
    group_label: "Width Attributes"
    type: string
    sql: ${TABLE}.width_of_hair ;;
  }


  dimension: gram_weight {
    hidden: no
    group_label: "Weight Attributes"
    type: number
    sql: ${TABLE}.gram_weight ;;
  }

  dimension: weight {
    hidden: no
    group_label: "Weight Attributes"
    type: number
    sql: ${TABLE}.weight ;;
  }

  dimension: weight_count {
    hidden: no
    group_label: "Weight Attributes"
    type: string
    sql: ${TABLE}.weight_count ;;
  }

  dimension: weight_in_user_defined_unit {
    hidden: no
    group_label: "Weight Attributes"
    type: number
    sql: ${TABLE}.weight_in_user_defined_unit ;;
  }

  dimension: weight_unit_index {
    hidden: no
    group_label: "Weight Attributes"
    type: number
    sql: ${TABLE}.weight_unit_index ;;
  }


  dimension: actual_length {
    hidden: no
    group_label: "Length Attributes"
    type: string
    sql: ${TABLE}.actual_length ;;
  }

  dimension: hair_ext_length {
    hidden: no
    group_label: "Length Attributes"
    type: string
    sql: ${TABLE}.hair_ext_length ;;
  }

  dimension: hair_length {
    hidden: no
    group_label: "Length Attributes"
    type: string
    sql: ${TABLE}.hair_length ;;
  }

  dimension: length_cm {
    hidden: no
    group_label: "Length Attributes"
    type: string
    sql: ${TABLE}.length_cm ;;
  }



  dimension: hair_texture_id {
    hidden: no
    type: number
    sql: ${TABLE}.hair_texture_id ;;
  }




  dimension: image_url {
    hidden: no
    type: string
    sql: ${TABLE}.image_url ;;
  }

  dimension: income_account_id {
    hidden: no
    type: number
    sql: ${TABLE}.income_account_id ;;
  }




  dimension: hair_type_id {
    hidden: no
    type: number
    sql: ${TABLE}.hair_type_id ;;
  }

  dimension: item_type_id {
    hidden: no
    type: number
    sql: ${TABLE}.item_type_id ;;
  }

  dimension: type_name {
    hidden: no
    type: string
    sql: ${TABLE}.type_name ;;
  }



  dimension: location_id {
    hidden: no
    type: number
    sql: ${TABLE}.location_id ;;
  }

  dimension: merch_type {
    hidden: no
    type: string
    sql: ${TABLE}.Merch_type ;;
  }



  dimension: product_category {
    hidden: no
    type: string
    sql: ${TABLE}.ProductCategory ;;
  }

  dimension: product_category_parent {
    hidden: no
    type: string
    sql: ${TABLE}.ProductCategoryParent ;;
  }



  dimension: qb_id {
    hidden: no
    type: string
    sql: ${TABLE}.qb_id ;;
  }

  dimension: qb_name_0 {
    hidden: no
    type: string
    sql: ${TABLE}.qb_name_0 ;;
  }



  dimension: sale_unit_id {
    hidden: no
    group_label: "Sales Attributes"
    type: number
    sql: ${TABLE}.sale_unit_id ;;
  }

  dimension: substringend {
    hidden: no
    type: number
    sql: ${TABLE}.substringend ;;
  }

  dimension: sales_price {
    hidden: no
    group_label: "Sales Attributes"
    type: string
    sql: ${TABLE}.SalesPrice ;;
  }

  dimension: totalvalue {
    hidden: no
    group_label: "Sales Attributes"
    type: number
    sql: ${TABLE}.totalvalue ;;
  }

  dimension: salesdescription {
    hidden: no
    group_label: "Sales Attributes"
    type: string
    sql: ${TABLE}.salesdescription ;;
  }


  dimension: cost_0 {
    hidden: no
    group_label: "Manufacture Attributes"
    type: number
    sql: ${TABLE}.cost_0 ;;
  }

  dimension: country_of_manufacture {
    hidden: no
    group_label: "Manufacture Attributes"
    type: string
    sql: ${TABLE}.country_of_manufacture ;;
  }

  dimension: vendor_id {
    hidden: no
    group_label: "Manufacture Attributes"
    type: number
    sql: ${TABLE}.vendor_id ;;
  }

  dimension: vendorname {
    hidden: no
    group_label: "Manufacture Attributes"
    type: string
    sql: ${TABLE}.vendorname ;;
  }





  measure: count {
    hidden: no
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
