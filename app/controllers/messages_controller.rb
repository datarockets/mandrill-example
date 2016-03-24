class MessagesController < ApplicationController
  def create
    request = Vacancy::Request.find(params[:request_id])
    conversation = request.conversation
    if conversation.present?
      request.reply_to_conversation(conversation, params[:message][:body])
    else
      request.send_message(request.vacancy.user, params[:message][:body], request.vacancy.title)
    end

    redirect_to :back
  end
end
