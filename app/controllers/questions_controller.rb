class QuestionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @questions = Question.all
  end

  def create
    # Iterate over each question to create a user_question with the answer
    @questions = Question.all
    @questions.each do |question|
      answer = params[question.id.to_s] # Get the user's answer from the form
      if answer.present?
        UserQuestion.create(user: current_user, question: question, answer: answer)
      end
    end
    redirect_to root_path, notice: "Your answers have been saved!"
  end
end
