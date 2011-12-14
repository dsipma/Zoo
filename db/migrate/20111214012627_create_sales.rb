class CreateSales < ActiveRecord::Migration
  def self.up
    create_table :sales do |t|
      t.integer :user_id
      t.integer :animal_id
      t.timestamps
    end
  end

  def self.down
    drop_table :sales
  end
end
