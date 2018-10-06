class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :tag
      t.integer :count
      t.integer :cp_one
      t.integer :cp_two
      t.integer :cp_three
      t.integer :cp_four
      t.integer :cp_five
      t.integer :cp_one_second
      t.integer :cp_two_second
      t.integer :cp_three_second
      t.integer :cp_four_second
      t.integer :cp_five_second
      t.integer :cp_one_third
      t.integer :cp_two_third
      t.integer :cp_three_third
      t.integer :cp_four_third
      t.integer :cp_five_third

      t.timestamps
    end
  end
end
