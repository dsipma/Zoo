class User < ActiveRecord::Base

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  before_save :cap_name
   
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :admin
  has_many :animals, :through => :owners, :dependent => :destroy
  has_many :owners
  has_many :sales
  
  validates :name,     :presence => true,
                        :length => { :maximum => 50 }
  validates :email,     :presence => true,
                        :format => { :with => email_regex },
                        :uniqueness => { :case_sensitive => false }
  composed_of :money,
              :class_name => 'Money',
              :mapping => %w(money cents),
              :converter => Proc.new { |value| value.respond_to?(:to_money) ? value.to_money : Money.empty }

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

