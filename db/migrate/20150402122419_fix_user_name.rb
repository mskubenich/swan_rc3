class FixUserName < ActiveRecord::Migration
  def change
    remove_column :users, :first_nale
    add_column :users, :first_name, :string
  end
end
