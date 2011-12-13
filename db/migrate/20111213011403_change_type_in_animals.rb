class ChangeTypeInAnimals < ActiveRecord::Migration
  def self.up
    rename_column :animals, :type, :species
  end

  def self.down
    rename_column :animals, :species, :type
  end
end
