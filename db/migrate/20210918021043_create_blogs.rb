class CreateBlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :blogs do |t|
      t.references :idol, null: false, foreign_key: true
      t.string :title
      t.string :piece_title
      t.string :thumbnail
      t.text :outline
      t.date :piece_release_on

      t.timestamps
    end
  end
end
