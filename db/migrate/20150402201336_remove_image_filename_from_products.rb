class RemoveImageFilenameFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :image_filename, :string
  end
end
