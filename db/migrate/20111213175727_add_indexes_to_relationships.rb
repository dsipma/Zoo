class AddIndexesToRelationships < ActiveRecord::Migration
  def self.up
    add_index :relationships, :predator_id
    add_index :relationships, :prey_id
  end

  def self.down
    remove_index :relationships, :predator_id
    remove_index :relationships, :prey_id
  end
end
