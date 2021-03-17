view: dim_brand {
  sql_table_name: dbo.DimBrand ;;

  dimension: subsidiary_id {
    label: "Subsidiary ID"
    hidden: yes
    type: number
    sql: ${TABLE}.Subsidiary_id ;;
  }

  dimension: subsidiary_name {
    label: "Subsidiary Name"
    type: string
    sql: ${TABLE}.Subsidiary_Name ;;
  }

  dimension: brand_id {
    label: "Brand ID"
    hidden: yes
    type: number
    sql: ${TABLE}.Brand_id ;;
  }

  dimension: brand_name {
    label: "Brand"
    hidden: yes
    type: string
    sql: ${TABLE}.Brand_Name ;;
  }

  #### THIS CAN BE USED FOR BENCHMARKING BRANDS
  filter: company_for_comparison {
    description: "Use with Brand Benchmark"
    type: string
    suggest_dimension: brand_parent_name
  }

  dimension: brand_benchmark {
    type: string
    sql: CASE
            WHEN {% condition company_for_comparison %} ${brand_parent_name} {% endcondition %} THEN ${brand_name}
            ELSE 'All Other Brands'
          END ;;
    description: "Use this field to compare one Brand against all others."
    }

  dimension: brand_benchmark_with_group {
    type: string
    sql: CASE
            WHEN {% condition company_for_comparison %} ${brand_parent_name} {% endcondition %} THEN 'Group of Chosen Brands'
            ELSE 'All Other Brands'
          END ;;
    description: "Use this field to compare multiple Brands against all others."
  }

  dimension: brand_parent_name {
    label: "Brand Name"
    type: string
    sql: ${TABLE}.Brand_Parent_Name ;;
    description: "Use this field to help you partition the data by Brand. This field will help you be able to view metrics for different brands."
  }

  dimension: brand_city {
    group_label: "Brand Location"
    label: "Brand City"
    type: string
    sql: ${TABLE}.Brand_City ;;
    description: "Use this field to filter where brands are in specific Cities."
  }

  dimension: brand_country {
    group_label: "Brand Location"
    label: "Brand Country"
    type: string
    sql: ${TABLE}.Brand_Country ;;
    description: "Use this field to filter where brands are in specific Countries."
  }

  dimension: brand_state {
    group_label: "Brand Location"
    label: "Brand State"
    type: string
    sql: ${TABLE}.Brand_State ;;
    description: "Use this field to filter where brands are in specific States."
  }

  dimension: brand_zip_code {
    group_label: "Brand Location"
    label: "Brand Zip Code"
    type: string
    sql: ${TABLE}.Brand_ZipCode ;;
    description: "Use this field to filter where brands are in specific Zip Codes."
  }

  measure: count {
    type: count
    drill_fields: [brand_name, brand_parent_name, subsidiary_name]
  }
}
