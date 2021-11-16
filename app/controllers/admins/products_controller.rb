class Admins::ProductsController < Admins::ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  def index
    @products = Product.all
  end

  def show; end

  def new
    @product = Product.new
    @product_version = @product.product_versions.build
  end

  def edit; end

  def create
    @product = Product.new
    @product.product_versions.build(product_params[:product_version])
    if @product.save
      redirect_to [:admins, @product], notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def update
    @product.product_versions.build(product_params[:product_version])
    if @product.save
      redirect_to [:admins, @product], notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to admins_products_url, notice: 'Product was successfully destroyed.'
  end

  private

  def set_product
    @product = Product.find(params[:id])
    @product_version = @product.latest_version
  end

  def product_params
    params.require(:product).permit(product_version: %i[name description price published])
  end
end
