class User < ActiveRecord::Base

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
   
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :admin

  has_many :animals, :through => :owners, :dependent => :destroy
  has_many :owners
  has_many :sales
  has_many :purchases
  
  validates :name,     :presence => true,
                        :length => { :maximum => 50 }
  validates :email,     :presence => true,
                        :format => { :with => email_regex },
                        :uniqueness => { :case_sensitive => false }

  before_save :cap_name

  composed_of :money,
              :class_name => 'Money',
              :mapping => %w(money cents),
              :converter => Proc.new { |value| value.respond_to?(:to_money) ? value.to_money : Money.empty }

  def purchase!(animal)
    if(animal.price <= self.money)
      owners.create!(:animal_id => animal.id)
      self.money -= animal.price
      self.save
      Purchase.create(:user_id => self.id, :animal_id =>animal.id)
    else
      return false
    end

  end

  def sell!(animal)
    self.money += animal.price
    self.save
    owners.find_by_animal_id(animal).destroy
    Sale.create(:user_id => self.id, :animal_id =>animal.id)
  end

  private
  def cap_name
    self.name.capitalize!
  end
end



# == Schema Information
#
# Table name: users
#
#  id                     :integer         not null, primary key
#  created_at             :datetime
#  updated_at             :datetime
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(128)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  name                   :string(255)
#  admin                  :boolean         default(FALSE)
#  money                  :integer         default(10000)
#

