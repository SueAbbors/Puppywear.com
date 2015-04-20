class CustomersController < ApplicationController
  def index
    @customer = Customer.all
  end

  def customer_show
    @customer = Customer.find(params[:id])
    
  end

  def full_name
    return "#{first_name} #{last_name}"
  end
end
