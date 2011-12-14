class Purchase < ActiveRecord::Base
   belongs_to :user
  belongs_to :animal

   validates :user_id, :presence => true
  validates :animal_id, :presence => true
end
