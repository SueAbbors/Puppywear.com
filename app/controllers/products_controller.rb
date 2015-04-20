class ProductsController < ApplicationController
  
  def index
    @products = Product.order(:title).page(params[:page]).per(5)
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
  
  def search
    
  end
  
  def search_results
    if params[:category_id].to_i == 0
      @products = Product.where("title LIKE '%#{params[:search_keywords]}%'")
    else
     @products = Product.where("title LIKE '%#{params[:search_keywords]}%' and category_id = #{params[:category_id]}")
    end
    @categories = Category.all
  end
  def recent
    @products = Product.where('created_at > :date', date: 1.week.ago)
    @categories = Category.all
  end
  
  def on_sale
   @products = Product.where("CAST(price AS STRING) LIKE '%99'")
    @categories = Category.all 
  
  end
  
private
  def product_params
    params.require(:product).permit(:title, :description, :price, :image, :stock_quantity, :category_id)              
  end
end

