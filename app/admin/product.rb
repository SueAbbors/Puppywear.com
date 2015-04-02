ActiveAdmin.register Product do
  
 permit_params :title, :description, :price, :image, :category, :stock_quantity

   
end  