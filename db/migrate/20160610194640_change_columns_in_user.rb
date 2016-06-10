class ChangeColumnsInUser < ActiveRecord::Migration
  def change
    rename_column(:users, :first_name, :name)
    remove_column(:users, :last_name)
    remove_column(:users, :is_admin)
  end
end
