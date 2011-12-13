module UsersHelper
  def admin?
    if current_user_signed_in? && current_user.admin
      user
    end
  end
  
 
end
