view: sales_data {
  derived_table: {
    sql:
      select
        *
      from
        "DATE_SETS"."sales_Date"
  ;;
  }

  dimension: cost_of_sales {
    type: string
    sql: ${TABLE}."Cost_of_Sales" ;;
  }
  dimension: customer_id {
    type: number
    sql: ${TABLE}."Customer_ID" ;;
  }
  dimension: gross_profit {
    type: string
    sql: ${TABLE}."Gross_Profit" ;;
  }
  dimension: order_date_key {
    type: number
    sql: ${TABLE}."Order_date_KEY" ;;
  }
  dimension: product_id {
    type: number
    sql: ${TABLE}."Product_ID" ;;
  }
  dimension: quantity {
    type: string
    sql: ${TABLE}."Quantity" ;;
  }
  dimension: sales {
    type: string
    sql: ${TABLE}."Sales" ;;
  }
  dimension: sales_date {
    type: string
    sql: ${TABLE}."Sales_Date" ;;
  }
  dimension_group: period {
    type: time
    datatype: datetime
    timeframes: [
      date,
      week,
      month
    ]
    sql: ${TABLE}"Sales_Date" ;;
  }
  dimension: store_id {
    type: number
    sql: ${TABLE}."Store_ID" ;;
  }
  dimension: voucher_number {
    type: string
    sql: ${TABLE}."Voucher_Number" ;;
  }
  measure: count {
    type: count
  }
  dimension: sales_comparison {
    type:  yesno
    sql: ${TABLE}"Sales" >= 500 ;;
  }

  measure:  sales_amount{
    type: sum
    label: "売上総計"
    sql: ads(${TABLE}."Sales") ;;
  }
  measure: member_amount {
    type: sum
    label: "合計会員数"
    sql: abs(${TABLE}."Number_of_Members") ;;
  }
  measure: female_members{
    type: sum
    sql: CASE WHEN ${TABLE}."Gender" = "女性"
    THEN ${TABLE}."Number_of_Menbers" ELSE 0 END;;
  }
  measure: male_members{
    type: sum
    sql: CASE WHEN ${TABLE}."Gender" = "男性"
      THEN ${TABLE}."Number_of_Menbers" ELSE 0 END;;
  }
  measure: average_sales {
    type: average
    label: "平均売上額"
    value_format: "\"￥\"#,##0"
    sql: abs(${TABLE}."Sales") ;;
  }
}
