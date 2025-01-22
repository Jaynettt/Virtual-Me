# app/services/openai_service.rb
require 'openai'

class OpenAIService
  def initialize
    @client = OpenAI::Client.new(access_token: ENV['OPENAI_API_KEY'])
  end

  def generate_personality(user)
    # Retrieve user's answers
    answers = UserQuestion.where(user_id: user.id).includes(:question).map do |user_question|
      { role: 'user', content: "Q: #{user_question.question.content} A: #{user_question.answer}" }
    end

    # System prompt to instruct ChatGPT to mimic the user
    messages = [
      { role: 'system', content: "You are an AI that mimics the user's personality based on the answers provided to you." }
    ] + answers

    # Add a prompt to start the conversation
    messages << { role: 'user', content: "Let's have a conversation." }

    # Make the API call
    response = @client.chat(
      parameters: {
        model: "gpt-4",
        messages: messages
      }
    )

    response.dig("choices", 0, "message", "content")
  end

  def get_conversation_response(user, message)
    # Retrieve user's answers for context
    answers = UserQuestion.where(user_id: user.id).includes(:question).map do |user_question|
      { role: 'user', content: "Q: #{user_question.question.content} A: #{user_question.answer}" }
    end

    # System prompt to instruct ChatGPT
    messages = [
      { role: 'system', content: "You are an AI that mimics the user's personality based on the answers provided to you." }
    ] + answers

    # Add the new user message
    messages << { role: 'user', content: message }

    # Make the API call
    response = @client.chat(
      parameters: {
        model: "gpt-4",
        messages: messages
      }
    )

    response.dig("choices", 0, "message", "content")
  end
end
