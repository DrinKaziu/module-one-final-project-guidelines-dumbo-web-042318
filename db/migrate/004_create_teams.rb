class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :mascot
      t.string :colors
      t.integer :championships
      t.integer :sport_id
      t.integer :city_id
    end
  end
end
