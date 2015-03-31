class RenameColumnFirstNaleToFirstName < ActiveRecord::Migration
  def change
    rename_column :users, :first_nale, :first_name
  end
end
