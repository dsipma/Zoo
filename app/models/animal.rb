class Animal < ActiveRecord::Base
  has_many :users, :through => :owner
  validates :species, :presence => true
  validates :info,    :presence => true
  validates :value, :numericality => {:greater_than_or_equal_to => 0}, :message => "Animal needs a monetary value"
end



# == Schema Information
#
# Table name: animals
#
#  id         :integer         not null, primary key
#  species    :string(255)
#  info       :text
#  created_at :datetime
#  updated_at :datetime
#  value      :integer
#

