class CreateApprovals < ActiveRecord::Migration
  def change
    create_table :approvals do |t|
      t.references :contract, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.datetime :date_requested
      t.datetime :date_answered
      t.string :status

      t.timestamps null: false
    end
  end
end
