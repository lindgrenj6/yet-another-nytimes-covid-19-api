# frozen_string_literal: true

class CreateCounties < ActiveRecord::Migration[6.0]
  def change
    create_table :counties do |t|
      t.date :date
      t.string :name
      t.string :state
      t.integer :fips
      t.integer :cases
      t.integer :deaths

      t.timestamps
    end
  end
end
