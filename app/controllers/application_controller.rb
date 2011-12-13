class ApplicationController < ActionController::Base
  protect_from_forgery
  include DeviseHelper
  include UsersHelper
end
