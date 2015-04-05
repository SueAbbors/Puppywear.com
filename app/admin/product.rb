ActiveAdmin.register Product do
  
 permit_params :title, :description, :price, :image, :category_id, :stock_quantity

   
end  