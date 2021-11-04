class CreateInquiries < ActiveRecord::Migration[6.1]
  def change
    create_table :inquiries do |t|
      t.string :last_name
      t.string :first_name
      t.string :email
      t.string :subject
      t.text :content

      t.timestamps
    end
  end
end
