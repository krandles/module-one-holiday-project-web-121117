class CreateBeers < ActiveRecord::Migration[5.0]
  def change
    create_table :beers do |t|
      t.string :name
      t.float :abv
      t.integer :style_id
      t.references :brewery, index: true, foreign_key: true
    end
  end
end
