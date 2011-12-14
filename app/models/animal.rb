class Animal < ActiveRecord::Base
  has_many :users, :through => :owner

  has_many :relationships,          :foreign_key => "predator_id", :dependent => :destroy
  has_many :prey, :through => :relationships, :source => "prey"

  has_many :reverse_relationships,  :foreign_key => "prey_id", :dependent => :destroy,
                                    :class_name => "Relationship"
  has_many :predators, :through => :reverse_relationships, :source => "predator"

  has_many :sales

  before_save :cap
  before_destroy :ensure_not_referenced_by_any_line_item
  
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

   private
    # ensure that there are no line items referencing this product
    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else
        errors.add(:base, "Animal is in a user's cart")
        return false
      end
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

