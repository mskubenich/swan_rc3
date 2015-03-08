class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string 'title'
      t.text 'body'
      t.timestamps null: true
    end
  end
end
