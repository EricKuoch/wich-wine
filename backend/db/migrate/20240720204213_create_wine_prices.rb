class CreateWinePrices < ActiveRecord::Migration[7.1]
  def change
    create_table :wine_prices do |t|
      t.float :price
      t.date :date

      t.timestamps
    end
  end
end
