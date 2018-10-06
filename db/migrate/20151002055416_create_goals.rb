class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :participant
      t.datetime :time

      t.timestamps
    end
  end
end
