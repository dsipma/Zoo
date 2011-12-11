module UsersHelper
  def admin?
    if user_signed_in? && This.admin
      user
    end
  end
end
