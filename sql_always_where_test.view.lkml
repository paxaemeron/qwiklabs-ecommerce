view: sql_always_where_test {
  derived_table: {
    sql: SELECT
          users.city  AS users_city,
          COUNT(DISTINCT users.id ) AS users_count
      FROM `cloud-training-demos.looker_ecomm.order_items` AS order_items
      LEFT JOIN `cloud-training-demos.looker_ecomm.users`
           AS users ON order_items.user_id = users.id
      WHERE (order_items.created_at ) >= (TIMESTAMP('2012-01-01 00:00:00'))
      GROUP BY
          1
      ORDER BY
          2 DESC
      LIMIT 500
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: users_city {
    type: string
    sql: ${TABLE}.users_city ;;
  }

  dimension: users_count {
    type: number
    sql: ${TABLE}.users_count ;;
  }

  set: detail {
    fields: [users_city, users_count]
  }
}
