class ProfilesController < ApplicationController
  def avatar_creator
    # Check if user has completed all questions
    if current_user.user_questions.count < 5
      redirect_to questions_path, alert: "Please complete all questions first."
    end
  end

  def save_avatar
    current_user.update(avatar_url: params[:avatar_url])
    redirect_to profile_path(current_user), notice: "Avatar saved successfully."
  end
end
