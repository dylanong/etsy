class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_categories

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

  def set_categories
    @parent_categories = Category.main
    @sub_categories = @parent_categories.map { |parent| parent.find_children }
  end
end
