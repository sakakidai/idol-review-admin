class CreateDistributors < ActiveRecord::Migration[6.1]
  def change
    create_table :distributors do |t|
      t.references :blog, null: false, foreign_key: true
      t.string :name
      t.string :url

      t.timestamps
    end
  end
end
