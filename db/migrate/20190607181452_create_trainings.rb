class CreateTrainings < ActiveRecord::Migration[5.2]
  def change
    create_table :trainings do |t|
      t.string :name 
      t.integer :client_id
      t.integer :instructor_id
      t.timestamps
    end
  end
end
