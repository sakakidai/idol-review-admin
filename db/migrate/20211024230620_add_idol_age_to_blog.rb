class AddIdolAgeToBlog < ActiveRecord::Migration[6.1]
  def change
    add_column :blogs, :idol_age, :integer
  end
end
