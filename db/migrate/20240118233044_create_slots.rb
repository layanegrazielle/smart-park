class CreateSlots < ActiveRecord::Migration[7.1]
  def change
    create_table :slots do |t|
      t.string :coordinates, null: false
      t.boolean :occupied, null: false, default: false
      t.string :sensor_id, null: false

      t.timestamps
    end

    add_index :slots, :coordinates, unique: true
    add_index :slots, :sensor_id, unique: true
  end
end
