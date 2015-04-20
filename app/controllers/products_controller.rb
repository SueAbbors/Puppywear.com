class ProductsController < ApplicationController
  
  def index
    @products = Product.order(:title).page(params[:page]).per(5)
    @cart_items = get_cart_items
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
  
  def add_item_to_cart
    session[:cart]<< params[:id]
    redirect_to root_path
  end

  def checkout
    @cart_items = session[:cart].map do |item|
      Product.find(item)
  end
  end
  def create
  @cart_items = session[:cart].map do |item|
    Product.find(item)
  end
  @customer = Customer.create
  @customer.province_id = params[:province]
  @customer.first_name = params[:first_name]
  @customer.last_name = params[:last_name]
  @customer.address = params[:address]
  @customer.city = params[:city]

  if @customer.save!
    @order = @customer.orders.build
    @order.status = 'pending'
    @order.gst = @customer.province.gst
    @order.pst = @customer.province.pst
    @order.hst = @customer.province.hst

    if @order.save!
      @cart_items.each do |item|
        @line_item = @order.line_items.build
        @line_item.quantity = 1
        @line_item.product = item
        @line_item.price = item.price
        @line_item.save!
      end
    end
  end
  reset_session
  redirect_to root_path
  flash[:alert] = 'Order succesfully completed'
end
  
private
  def product_params
    params.require(:product).permit(:title, :description, :price, :image, :stock_quantity, :category_id)              
  end
  
  private
  def get_cart_items
    session[:cart].map do |item|
    items = Product.find(item)
    end
  end
end

