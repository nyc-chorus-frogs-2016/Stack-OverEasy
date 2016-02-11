class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :questioner_id
      t.string :title
      t.string :content

      t.timestamps null: false
    end
  end
end
