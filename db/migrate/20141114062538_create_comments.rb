class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.text :content
      t.integer :article_id

      t.timestamps
    end
    add_index :comments, [:id, :created_at]
   end
end
