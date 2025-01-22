class ConversationsController < ApplicationController
 
  def index
    @conversations = Conversation.all
  end

  def show
    @conversation = Conversation.find(params[:id])

    @user = current_user
    @response = OpenAIService.new.generate_personality(@user)
  end

  def new
    @conversation = Conversation.new
  end

  def create
    @user = current_user
    user_message = params[:message]
    render json: { response: ai_response }
    ai_response = OpenAIService.new.get_conversation_response(@user, user_message)
    @conversation = Conversation.new(conversation_params)
    if @conversation.save
      redirect_to @conversation
      render :new
    end
  end

  def update
    if @conversation.update(conversation_params)
      redirect_to @conversation
    else
      render :edit
    end
  end

  def destroy
    @conversation.destroy
    redirect_to conversations_url
  end

  private

  def set_conversation
    @conversation = Conversation.find(params[:id])
  end

  def conversation_params
    params.require(:conversation).permit(:title)
  end
end
