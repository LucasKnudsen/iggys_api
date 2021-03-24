class Api::MessagesController < ApplicationController
  before_action :authenticate_user!, only: :create

  def index 
    messages = Message.all
    render json: {messages: messages}
  end

  def create
    current_user.messages.create(content: params[:content])
    render json: {
      message: 'Successful'
    }, status: 201
  end
end
