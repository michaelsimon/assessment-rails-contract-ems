class CreateActs < ActiveRecord::Migration
  def change
    create_table :acts do |t|
      t.string :name
      t.text :description
      t.string :location
      t.integer :size
      t.string :website

      t.timestamps null: false
    end
  end
end
