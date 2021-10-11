class AddPieceImageToBlog < ActiveRecord::Migration[6.1]
  def change
    add_column :blogs, :piece_image, :string
  end
end
