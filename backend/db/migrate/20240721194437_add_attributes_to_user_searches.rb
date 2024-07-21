class AddAttributesToUserSearches < ActiveRecord::Migration[7.1]
  def change
    add_column :user_searches, :name, :string
    add_column :user_searches, :region, :string
    add_column :user_searches, :vineyard, :string
    add_column :user_searches, :age, :integer
  end
end
