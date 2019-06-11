class Adddaytimetotrainings < ActiveRecord::Migration[5.2]
  def change
    add_column :trainings, :daytime, :daytime 
  end
end
