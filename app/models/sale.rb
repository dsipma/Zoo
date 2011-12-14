class Sale < ActiveRecord::Base
  belongs_to :user
  belongs_to :animal

  validates :user_id, :presence => true
  validates :animal_id, :presence => true
  end
# == Schema Information
#
# Table name: sales
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  animal_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

