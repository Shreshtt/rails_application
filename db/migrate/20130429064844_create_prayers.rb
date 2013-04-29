class CreatePrayers < ActiveRecord::Migration
  def change
    create_table :prayers do |t|
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end
end
