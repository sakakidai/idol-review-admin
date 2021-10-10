class AddPublishBlogsCountToIdol < ActiveRecord::Migration[6.1]
  def change
    add_column :idols, :publish_blogs_count, :integer, default: 0, null: false
  end
end
