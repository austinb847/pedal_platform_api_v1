class CreatePedals < ActiveRecord::Migration[5.2]
  def change
    create_table :pedals do |t|
      t.string :name
      t.integer :price
      t.string :brand
      t.string :description
      t.integer :quantity
      t.boolean :featured
      t.string :image_url
      t.string :kind
      t.string :category
      t.string :country_origin

      t.timestamps
    end
  end
end
