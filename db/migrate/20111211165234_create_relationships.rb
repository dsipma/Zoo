class CreateRelationships < ActiveRecord::Migration
  def self.up
    create_table :relationships do |t|
      t.integer :predator_id
      t.integer :prey_id

      t.timestamps
    end
  end

  def self.down
    drop_table :relationships
  end
end
