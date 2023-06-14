class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :title
      t.references :blog, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end

    add_column :blogs, :category_id, :integer
  end
end
