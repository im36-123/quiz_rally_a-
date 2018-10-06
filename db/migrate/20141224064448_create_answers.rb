class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :choice_id
      t.text :explanation
      t.integer :answer_count

      t.timestamps
    end
  end
end
