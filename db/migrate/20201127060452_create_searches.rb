class CreateSearches < ActiveRecord::Migration[6.0]
  def change
    create_table :searches do |t|
      t.string :keywords
      t.integer :category_id
      t.integer :brand_id
      t.integer :color_id
      t.decimal :min_price
      t.decimal :max_price
      t.integer :rating

      t.timestamps
    end
  end
end
