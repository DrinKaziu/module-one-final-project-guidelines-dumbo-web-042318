class AddColumnToTeams < ActiveRecord::Migration[5.0]
  def change
    add_column :teams, :info, :text 
  end
end
