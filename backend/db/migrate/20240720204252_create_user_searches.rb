class CreateUserSearches < ActiveRecord::Migration[7.1]
  def change
    create_table :user_searches do |t|
      t.references :user, null: false, foreign_key: true
      t.jsonb :search_criteria

      t.timestamps
    end
  end
end
