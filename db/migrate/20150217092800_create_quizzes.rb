class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.integer :quiz_num
      t.text :quiz_txt
      t.text :quiz_img_path
      t.integer :count

      t.timestamps
    end
  end
end
