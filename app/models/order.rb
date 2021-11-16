class Order < ApplicationRecord
  belongs_to :user
  belongs_to :delivery_time
  has_many :order_products
end
