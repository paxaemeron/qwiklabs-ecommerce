# If necessary, uncomment the line below to include explore_source.
# include: "training_ecommerce.model.lkml"

view: order_details {
  derived_table: {
    explore_source: order_items {
      column: order_id {}
      column: user_id {}
      column: order_item_count {}
      column: total_revenue {}
    }
  }
  dimension: order_id {
    type: number
  }
  dimension: user_id {
    type: number
  }
  dimension: order_item_count {
    type: number
  }
  dimension: total_revenue {
    value_format: "$#,##0.00"
    type: number
  }
}
