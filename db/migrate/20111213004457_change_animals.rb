class ChangeAnimals < ActiveRecord::Migration
  def self.up
    add_column :animals, :value, :integer
    remove_column :animals, :size
  end

  def self.down
    remove_column :animals, :value, :integer
    add_column :animals, :size, :integer
  end
end
