class Relationship < ActiveRecord::Base
  belongs_to :predator, :class_name => "Animal"
  belongs_to :prey, :class_name => "Animal"

  validates :predator_id, :presence => true
  validates :prey_id,     :presence => true
end

# == Schema Information
#
# Table name: relationships
#
#  id          :integer         not null, primary key
#  predator_id :integer
#  prey_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

