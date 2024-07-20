class AddReferencesToTastingNotes < ActiveRecord::Migration[7.1]
  def change
    add_reference :tasting_notes, :wine, null: false, foreign_key: true
  end
end
