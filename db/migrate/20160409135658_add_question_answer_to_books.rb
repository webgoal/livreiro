class AddQuestionAnswerToBooks < ActiveRecord::Migration
  def change
    add_column :books, :question, :string
    add_column :books, :answer, :string
  end
end
