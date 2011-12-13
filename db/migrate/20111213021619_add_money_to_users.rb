class AddMoneyToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :money, :integer, :default => "10000"
  end

  def self.down
    remove_column :users, :money
  end
end
