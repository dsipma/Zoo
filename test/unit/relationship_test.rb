require 'test_helper'

class RelationshipTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
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

