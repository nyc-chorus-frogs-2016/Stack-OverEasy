class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.references :commenter, index: true

      t.references :commentable, polymorphic: true, index: true
      # t.string :commentable_type
      # t.integer :commentable_id, index: true


      t.timestamps null: false
    end
  end
end
