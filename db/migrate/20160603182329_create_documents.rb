class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.references :contract, index: true, foreign_key: true
      t.string :name
      t.string :description
      t.string :location

      t.timestamps null: false
    end
  end
end
