class Product < ApplicationRecord
  has_many :product_versions, dependent: :destroy
  has_many :cart_products

  def latest_version
    product_versions.order(created_at: :desc).limit(1).first
  end
end
