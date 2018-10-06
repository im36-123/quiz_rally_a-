class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.integer :quiz_id
      t.text :choice_txt
      t.integer :correct_flag
      t.integer :choice_count

      t.timestamps
    end
  end
end
