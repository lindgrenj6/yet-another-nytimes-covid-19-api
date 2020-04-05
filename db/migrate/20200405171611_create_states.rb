# frozen_string_literal: true

class CreateStates < ActiveRecord::Migration[6.0]
  def change
    create_table :states do |t|
      t.date :date
      t.string :name
      t.integer :fips
      t.integer :cases
      t.integer :deaths

      t.timestamps
    end
  end
end
