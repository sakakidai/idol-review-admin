class CreateIdols < ActiveRecord::Migration[6.1]
  def change
    create_table :idols do |t|
      t.string :name
      t.string :image
      t.date :birth_date
      t.text :comment

      t.timestamps
    end
  end
end
