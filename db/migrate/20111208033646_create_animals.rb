class CreateAnimals < ActiveRecord::Migration
  def self.up
    create_table :animals do |t|
      t.string :type
      t.integer :value
      t.text :info
      t.integer :predator_id
      t.integer :prey_id
      t.integer :size

      t.timestamps
    end
  end

  def self.down
    drop_table :animals
  end
end
