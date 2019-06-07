class Instructors < ActiveRecord::Migration[5.2]
  def change
    create_table :intructors do |t|
      t.string :name
      t.string :gym
      t.string :specialty
    end
  end
end
