class Users::CartProductsController < Users::ApplicationController
  before_action :set_cart_product, only: %i[destroy]

  def index
    @cart_products = current_user.cart_products.map
  end

  def create
    @cart_product = current_user.cart_products.build(cart_product_params)
    if @cart_product.save
      redirect_to users_cart_products_url, notice: 'CartProduct was successfully created.'
    else
      render [:users, @cart_product.product]
    end
  end

  def destroy
    @cart_product.destroy
    redirect_to users_cart_products_url, notice: 'CartProduct was successfully destroyed.'
  end

  private

  def set_cart_product
    @cart_product = CartProduct.find(params[:id])
  end

  def cart_product_params
    params.require(:cart_product).permit(:product_id)
  end
end
