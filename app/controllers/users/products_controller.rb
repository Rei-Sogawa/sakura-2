class Users::ProductsController < Users::ApplicationController
  before_action :set_product, only: %i[show]

  def index
    @products = Product.all.filter { |product| product.latest_version.published }
  end

  def show; end

  private

  def set_product
    @product = Product.find(params[:id])
    @product_version = @product.latest_version
  end
end
