class DropCounties < ActiveRecord::Migration[6.1]
  def change
    drop_table :counties
  end
end
