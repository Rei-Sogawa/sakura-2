# README

## タスク

- [x] admin devise
- [x] user devise
- [x] admin が product を CRUD する
- [x] user が product を R する
- [x] user が product を cart に入れる
- [x] user が cart 内の product から order を作る
- [x] user が order を R する
- [ ] admin が order を配送完了にする

## モデル

- user
- user_delivery_info
  - user_id
- admin
- product
- product_version
  - product_id
- cart_product
  - user_id
  - product_id
- order
  - user_id
  - delivery_time_id
- order_product
  - order_id
  - product_id
  - product_version_id
- delivery_time
- delivered_order
  - order_id
