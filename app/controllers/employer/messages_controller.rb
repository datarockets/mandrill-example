class Employer::MessagesController < ApplicationController
  def create
    request = Vacancy::Request.find(params[:request_id])
    conversation = request.conversation

    if conversation.present?
      current_user.reply_to_conversation(conversation, params[:message][:body])
    else
      current_user.send_message(request, params[:message][:body], request.vacancy.title)
    end

    redirect_to :back
  end
end
