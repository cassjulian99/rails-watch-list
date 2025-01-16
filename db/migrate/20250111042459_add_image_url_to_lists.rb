class AddImageUrlToLists < ActiveRecord::Migration[7.2]
  def change
    add_column :lists, :image_url, :string
  end
end

class CreateReviews < ActiveRecord::Migration[7.2]
  def change
    create_table :reviews do |t|
      t.text :content, null: false
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
