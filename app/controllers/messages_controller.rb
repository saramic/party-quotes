# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :set_message, only: %i[show edit update]

  def show
  end

  def new
    @message = Message.new
  end

  def edit
  end

  def create
    @message = Message.new(message_params)

    if @message.save
      redirect_to @message, notice: "Message was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @message.update(message_params)
      redirect_to @message, notice: "message was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_message
    @message = Message.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def message_params
    params.require(:message).permit(:text, :name)
  end
end
