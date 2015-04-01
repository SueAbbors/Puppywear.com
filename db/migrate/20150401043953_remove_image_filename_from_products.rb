class RemoveImageFilenameFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :image_filenme, :string
  end
end
