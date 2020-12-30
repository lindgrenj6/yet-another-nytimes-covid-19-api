class CreateUs < ActiveRecord::Migration[6.1]
  def change
    create_table :us do |t|
      t.date :date
      t.integer :cases
      t.integer :deaths

      t.timestamps
    end
  end
end
