class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :post_id
      t.string :author
      t.text :content

      t.timestamps null: false
    end
  end
end