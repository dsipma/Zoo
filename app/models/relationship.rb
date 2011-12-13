class Relationship < ActiveRecord::Base
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

