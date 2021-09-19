class AddThumbnailToBlog < ActiveRecord::Migration[6.1]
  def change
    add_column :blogs, :thumbnail, :string
  end
end
