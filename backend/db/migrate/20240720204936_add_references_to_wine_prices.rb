class AddReferencesToWinePrices < ActiveRecord::Migration[7.1]
  def change
    add_reference :wine_prices, :website, null: false, foreign_key: true
    add_reference :wine_prices, :wine, null: false, foreign_key: true
  end
end
