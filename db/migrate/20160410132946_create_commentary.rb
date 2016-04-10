class CreateCommentary < ActiveRecord::Migration
  def change
    create_table :commentaries do |t|
      t.string :name
      t.string :commentary
    end
  end
end
