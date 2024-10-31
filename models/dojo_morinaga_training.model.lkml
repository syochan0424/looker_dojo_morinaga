connection: "looker_dojo_morinaga"

include: "/views/*.view.lkml"
include: "/**/*.view.lkml"

datagroup: dojo_morinaga_training_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: dojo_morinaga_training_default_datagroup

explore: member_info_birth {
  label: "会員誕生日"
}

explore: sales_data {
  join: store_master {
    type: left_outer
    relationship: many_to_one
    sql_on: ${store_master.store_id} = ${sales_data.store_id} ;;
  }
}

explore:  budget_data{
  join: sales_data {
    type: left_outer
    relationship: many_to_one
    sql_on: ${budget_data.store_id} = ${sales_data.store_id} ;;
  }
}

explore: store_master {
  join: budget_data {
    type: left_outer
    relationship: many_to_many
    sql_on: ${store_master.store_id} = ${budget_data.store_id} ;;
  }
}

explore: category_master {
  join: product_master {
    type: left_outer
    relationship: one_to_many
    sql_on: ${category_master.category_id} = ${product_master.category_id} ;;
  }
}

explore: member_info {
  join: sales_data {
    type: left_outer
    relationship: one_to_many
    sql_on: ${member_info.customer_id} = ${sales_data.customer_id} ;;
  }
}

explore: product_master {
  extends: [sales_data,category_master]
  join: sales_data {
    type: left_outer
    relationship: one_to_many
    sql_on: ${product_master.product_id} = ${sales_data.product_id} ;;
  }
  join: category_master {
    type: left_outer
    relationship: many_to_one
    sql_on: ${product_master.category_id} = ${category_master.category_id} ;;
  }
}
