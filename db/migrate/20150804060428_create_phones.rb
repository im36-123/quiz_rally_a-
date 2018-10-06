class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.text :identification
      t.integer :quiz_id

      t.timestamps
    end
  end
end
