class ProductsController < ApplicationController
  def index
    @products = Product.order(:title)
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
    @categories = Category.all
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to action: :index
    else
     render :new 
    end
  end

  def edit
    @product = Product.find(params[:id])
    @categories = Category.all
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      redirect_to @product
    else
      render :edit
    end
  end

  def destroy
   @product = Product.find(params[:id])
   @product.destroy
    redirect_to root_path
  end
  
private
  def product_params
    params.require(:product).permit(:title, :description, :price, :image, :stock_quantity, :category_id)              
  end
end

