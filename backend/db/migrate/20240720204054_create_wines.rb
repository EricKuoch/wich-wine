class CreateWines < ActiveRecord::Migration[7.1]
  def change
    create_table :wines do |t|
      t.string :name
      t.integer :age
      t.string :vineyard
      t.string :region
      t.string :grape_variety
      t.decimal :alcohol_content
      t.text :description

      t.timestamps
    end
  end
end
