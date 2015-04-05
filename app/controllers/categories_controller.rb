class CategoriesController < ApplicationController

  def index
    @category = Category.all
  end
 
  def show
  end
  
  def new
    @category = Category.new
  end
end
