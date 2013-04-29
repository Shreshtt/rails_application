class AddIndexToPrayer < ActiveRecord::Migration
  def change
  	add_index :prayers, [:user_id, :created_at]
  end
end
