include: "/views/product_master.view.lkml"

view: product_inheritance {
  extends: [product_master]

  dimension:category_id {hidden:yes}

}
