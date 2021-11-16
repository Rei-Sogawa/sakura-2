class ProductVersion < ApplicationRecord
  belongs_to :product
  has_many :order_products

  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_initialize :set_default_values

  private

  def set_default_values
    self.name ||= ''
    self.description ||= ''
    self.price ||= 0
    self.published ||= false
  end
end
