class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :name
      t.integer :user_id
      t.integer :sport_id
      t.timestamps
    end
  end
end
