class Api::MessagesController < ApplicationController
  before_action :authenticate_user!, only: :create

  def index
    messages = Message.all
    render json: messages, root: 'messages', adapter: :json, each_serializer: MessageSerializer
  end

  def create
    if params[:content]
      new_message = current_user.messages.create(content: params[:content])
      serialized_message = ActiveModelSerializers::Adapter::Json.new(
        MessageSerializer.new(new_message)
      ).serializable_hash
      ActionCable.server.broadcast 'messages_channel', serialized_message
      head :ok
    else
      render json: {
        message: 'Unsuccessful'
      }, status: 422
    end
  end
end
