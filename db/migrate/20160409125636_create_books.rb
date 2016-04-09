class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :publisher
      t.string :owner
      t.string :email
      t.string :abstract
      t.timestamps null: false
    end
  end
end
