class NewCategorySearchController < ApplicationController
  
  def Category_Search
    @search = Category_Search.new
  end
  def create
    @search = Category_Search.create(params[:search])
    redirect_to @search
  end
  def show
    @search = Category_Search.find(params[:id])
  end
end
