class CreateLineItems < ActiveRecord::Migration[6.0]
  def change
    create_table :line_items do |t|
      t.integer :cart_id
      t.integer :game_id
      t.integer :quantity
      t.timestamps
    end
  end
end
