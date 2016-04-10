class AlterTableCommentariesAddColumnBookId < ActiveRecord::Migration
  def change
    add_column :commentaries, :book_id, :integer
  end
end
