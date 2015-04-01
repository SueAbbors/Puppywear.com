ActiveAdmin.register Product do
  
 permit_params :title, :description, :price, :image_filename, :stock_quantity



end  