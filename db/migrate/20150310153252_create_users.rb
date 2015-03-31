class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_nale
      t.string :last_name
      t.string :full_name
      t.string :email
      t.string :password

      t.timestamps null: false
    end
  end
end