module UsersHelper
  def admin?
    if current_user && current_user.admin
      user
    end
  end
   def admin_user
      redirect_to(root_path) unless current_user.admin?
    end


end
