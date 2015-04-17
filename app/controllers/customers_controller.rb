class CustomersController < ApplicationController
  def index
    @customer = Customer.all
  end

  def customer_show
    @customer = Customer.find(params[:id])
    
  end

 
end
