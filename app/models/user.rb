class User < ActiveRecord::Base
email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :admin
  has_many :animals
  
   validates :name,     :presence => true,
                        :length => { :maximum => 50 }
  validates :email,     :presence => true,
                        :format => { :with => email_regex },
                        :uniqueness => { :case_sensitive => false }
  validates :password,  :presence => true,
                        :confirmation => true,
                        :length => { :within => 6..40 }
  
end
