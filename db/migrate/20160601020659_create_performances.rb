class CreatePerformances < ActiveRecord::Migration
  def change
    create_table :performances do |t|
      t.references :act, index: true, foreign_key: true
      t.references :venue, index: true, foreign_key: true
      t.string :name
      t.date :perf_date
      t.time :perf_time
      t.string :tkts_url
      t.text :description

      t.timestamps null: false
    end
  end
end
