class Animal < ActiveRecord::Base
  composed_of :price,
              :class_name => 'Money',
              :mapping => %w(price cents),
              :converter => Proc.new { |value| value.respond_to?(:to_money) ? value.to_money : Money.empty }
    
  has_many :users, :through => :owner
  
  
  validates :species, :presence => true
  validates :info,    :presence => true
  validates :value, :numericality => {:greater_than_or_equal_to => 0}
  
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

