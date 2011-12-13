class Animal < ActiveRecord::Base
  has_many :users, :through => :owner

  has_many :relationships,          :foreign_key => "predator_id", :dependent => :destroy
  has_many :predators, :through => :relationships, :source => "prey"

  has_many :reverse_relationships,  :foreign_key => "prey_id", :dependent => :destroy,
                                    :class_name => "Relationship"
  has_many :prey, :through => :reverse_relationships, :source => "predator"

  before_save :cap
  
  validates :species, :presence => true
  validates :info,    :presence => true
  validates :price,   :numericality => { :greater_than => 0 }

  composed_of :price,
              :class_name => 'Money',
              :mapping => %w(price cents),
              :converter => Proc.new { |value| value.respond_to?(:to_money) ? value.to_money : Money.empty }

  private
  def cap
    self.species.capitalize!
    self.info.capitalize!
  end
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

