class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.string :genre, null: false
      t.boolean :display_status, null: false, default: true
      t.timestamps
    end
  end
end
