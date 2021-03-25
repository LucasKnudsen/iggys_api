class Api::MessagesController < ApplicationController
  before_action :authenticate_user!, only: :create

  def index
    messages = Message.all
    render json: { messages: messages }
  end

  def create
    if params[:content]
      current_user.messages.create(content: params[:content])
      render json: {
        message: 'Successful'
      }, status: 201
    else
      render json: {
        message: 'Unsuccessful'
      }, status: 422
    end
  end
end
