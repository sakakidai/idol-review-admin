class CreateBlogContentImages < ActiveRecord::Migration[6.1]
  def change
    create_table :blog_content_images do |t|
      t.references :blog, null: false, foreign_key: true
      t.string :image
      t.text :comment

      t.timestamps
    end
  end
end
