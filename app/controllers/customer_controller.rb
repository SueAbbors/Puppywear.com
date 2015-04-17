  def index
    @customer = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def new
    @customer = Customer.new
    
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to action: :index
    else
     render :new 
    end
  end

  def edit
    @customer = Customer.find(params[:id])
    
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update_attributes(customer_params)
      redirect_to @customer
        render :edit
    end
  end

  def destroy
   @customer = Customer.find(params[:id])
   @customer.destroy
    redirect_to root_path
  end