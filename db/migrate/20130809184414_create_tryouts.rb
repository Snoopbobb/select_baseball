class CreateTryouts < ActiveRecord::Migration
  def change
    create_table :tryouts do |t|
      t.integer :user_id
      t.datetime :date
      t.string :address
      t.string :city
      t.string :state
      t.string :ages
      t.string :contact
      t.text :info

      t.timestamps
    end
    add_index :tryouts, [:user_id, :created_at, :city, :state]
  end
end
