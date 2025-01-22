class MessagesController < ApplicationController
  def index
    @messages = @conversation.messages
  end
  def show
  end

  def new
    @message = Message.new
  end

  def update
    if @message.update(message_params)
      redirect_to conversation_message_path(@conversation, @message), notice: "Message was successfully edited."
    else
      render :edit
    end
  end

  def destroy
    @message.destroy
    redirect_to conversation_messages_path(@conversation), notice: "Message was successfully deleted."
  end

  private

  def set_message
    @message = Message.find(params[:id])
  end

  def set_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end

  def message_params
    params.require(:message).permit(:content) # Adjust params as necessary
  end
end
