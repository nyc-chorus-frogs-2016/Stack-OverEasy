class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.string :content, null: false
      t.integer :best_answer_id
      t.references :questioner, index: true



      t.timestamps null: false
    end
  end
end
