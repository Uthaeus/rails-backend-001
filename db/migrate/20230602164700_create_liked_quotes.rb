class CreateLikedQuotes < ActiveRecord::Migration[7.0]
  def change
    create_table :liked_quotes do |t|
      t.string :quote, null: false
      t.string :author, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
