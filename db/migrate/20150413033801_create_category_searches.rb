class CreateCategorySearches < ActiveRecord::Migration
  def change
    create_table :category_searches do |t|
      t.string :keywords
      t.integer :category_id
      t.decimal :min_price
      t.decimal :max_price

      t.timestamps
    end
  end
end
