class CreateLocations < ActiveRecord::Migration[7.1]
  def change
    create_table :locations do |t|
      t.string :host, null: false
      t.string :geolocation, null: false

      t.timestamps
    end

    add_index :locations, :host, unique: true
  end
end
