class ChangeValueToPriceInAnimals < ActiveRecord::Migration
  def self.up
    rename_column :animals, :value, :price
  end

  def self.down
    rename_column :animals, :price, :value
  end
end
