class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|

      t.timestamps null: false
    end
  end
end
