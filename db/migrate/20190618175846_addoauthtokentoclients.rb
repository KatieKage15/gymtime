class Addoauthtokentoclients < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :oauth_token, :string 
  end
end
