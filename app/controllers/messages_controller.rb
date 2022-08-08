# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :set_message, only: %i[show edit update]

  def show
  end

  def new
    @message = Message.new
  end

  def edit
    redirect_to @message, notice: "Message is now locked." if @message.created_at + 2.minutes < Time.zone.now
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

  def slideshow
    @pause = params[:pause] # pause for testing
    @time = 5 # 5 seconds default
    @time = Integer(params[:time], 10) if /\d+/.match?(params[:time])
    @message = Message.where(id: params[:id]).first || Message.order(:created_at).first
    message_ids = Message.select(:id).order(:created_at).pluck(:id)
    next_message_order_index = message_ids.index(@message.id) + 1
    @next_message_id = message_ids[next_message_order_index >= message_ids.length ? 0 : next_message_order_index]
    @next_refresh_path = slideshow_messages_path(id: @next_message_id, time: @time)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_message
    @message = Message.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def message_params
    params.require(:message).permit(:text, :name, :picture)
  end
end
