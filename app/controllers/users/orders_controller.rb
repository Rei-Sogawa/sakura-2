class Users::OrdersController < Users::ApplicationController
  def index
    @orders = current_user.orders
  end

  def show; end

  def new
    @order = current_user.orders.build
    @user_delivery_info = current_user.user_delivery_info || current_user.build_user_delivery_info
  end

  def create
    @order = current_user.orders.build(order_params)
    @order.update({
                    sub_total_price: current_user.sub_total_price,
                    cash_on_delivery: current_user.cash_on_delivery,
                    postage: current_user.postage,
                    total_price: current_user.total_price
                  })
    @order.save

    current_user.cart_products.each do |cart_product|
      @order.order_products.build({ product_id: cart_product.product.id,
                                    product_version_id: cart_product.product.latest_version.id }).save
    end

    if current_user.user_delivery_info
      current_user.user_delivery_info.update(user_delivery_info_params[:user_delivery_info])
    else
      current_user.build_user_delivery_info(user_delivery_info_params[:user_delivery_info]).save
    end

    current_user.cart_products.destroy_all

    redirect_to users_orders_path
  end

  private

  def order_params
    params.require(:order).permit(:delivery_date, :delivery_time_id)
  end

  def user_delivery_info_params
    params.require(:order).permit(user_delivery_info: %i[first_name last_name address postal_code])
  end
end
