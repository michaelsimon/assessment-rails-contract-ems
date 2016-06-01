class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.references :performance, index: true, foreign_key: true
      t.date :submit_date
      t.date :due_date
      t.string :status
      t.text :details

      t.timestamps null: false
    end
  end
end
