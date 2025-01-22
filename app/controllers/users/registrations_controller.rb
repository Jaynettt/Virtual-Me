class Users::RegistrationsController < ApplicationController
  def after_sign_up_path_for(resource)
    questions_path # Redirect to a custom page where questions are shown
  end
end
