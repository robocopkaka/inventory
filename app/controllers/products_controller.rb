class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to product_path, notice: "The product was successfully created" and return
    else
      render 'new'
    end
  end

  def edit
    @product = Product.find_by_id(params[:id])
  end

  def update
    @product = Product.find_by_id(params[:id])
    if @product.update_attributes(product_params)
      redirect_to product_path(@product), notice: "#{product.name} was updated successfully" and return
    end
    render 'edit'
  end

  def delete
  end

  private
  def product_params
    params.require(:product).permit(:name, :model, :manufacturer, :quantity, :expiry_date)
  end
end
