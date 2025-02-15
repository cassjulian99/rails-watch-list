class CreateMovies < ActiveRecord::Migration[7.2]
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.text :overview, null: false
      t.string :poster_url
      t.float :rating

      t.timestamps
    end
  end
end
