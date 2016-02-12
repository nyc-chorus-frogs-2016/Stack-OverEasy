class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :content
      t.references :question, index: true
      t.references :responder, index: true


      t.timestamps null: false
    end
  end
end
