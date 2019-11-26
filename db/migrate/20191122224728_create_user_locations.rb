class CreateUserLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :user_locations do |t|

      t.timestamps
    end
  end
end
