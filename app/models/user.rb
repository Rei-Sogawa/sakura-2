class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :user_delivery_info
  has_many :cart_products
  has_many :orders

  def sub_total_price
    cart_product_versions.sum(&:price)
  end

  def cash_on_delivery
    case sub_total_price
    when 0..9_999
      300
    when 10_000..29_999
      400
    when 30_000..100_000
      600
    when 100_000..nil
      1000
    end
  end

  def postage
    600 + 600 * (cart_products.size / 5)
  end

  def total_price
    without_tax = sub_total_price + cash_on_delivery + postage
    (without_tax * 1.1).to_i
  end

  private

  def cart_product_versions
    cart_products.map { |cart_product| cart_product.product.latest_version }
  end
end
