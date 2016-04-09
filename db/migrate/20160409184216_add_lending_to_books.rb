class AddLendingToBooks < ActiveRecord::Migration
  def change
    add_column :books, :lending_name, :string
    add_column :books, :lending_email, :string
    add_column :books, :lending_data, :date
  end
end
