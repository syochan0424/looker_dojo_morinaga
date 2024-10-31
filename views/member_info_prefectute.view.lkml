view: member_info_prefectute {
  derived_table: {
    sql:
      SELECT
        *
      FROM
        "DATA_SETS"."Member_Info"
      WHERE
        "Customer_Prefecture" = {%  parameter parameter_prefecture  %}
        ;;
  }
  parameter: parameter_prefecture{
    label: "顧客都道府県（フィルター用）"
    type: string
    suggestions: ["宮城県","千葉県","新潟県"]
    suggest_explore: Member_Info
    suggest_dimension: customer_prefecture
  }

  dimension: birthday {
    type: string
    sql: ${TABLE}."Birthday" ;;
  }
  dimension: customer_city {
    type: string
    sql: ${TABLE}."Customer_City" ;;
  }
  dimension: customer_id {
    type: number
    sql: ${TABLE}."Customer_ID" ;;
  }
  dimension: customer_prefecture {
    type: string
    sql: ${TABLE}."Customer_Prefecture" ;;
  }
  dimension: gender {
    type: string
    sql: ${TABLE}."Gender" ;;
  }
  dimension: member_registration_date {
    type: string
    sql: ${TABLE}."Member_Registration_Date" ;;
  }
  dimension: number_of_members {
    type: number
    sql: ${TABLE}."Number_of_Members" ;;
  }
  measure: count {
    type: count
  }
}
