class Vacancy::Request < ActiveRecord::Base
  acts_as_messageable

  belongs_to :vacancy
  belongs_to :user

  def mailboxer_email(object)
    user.mailboxer_email(object)
  end

  def conversation
    mailbox.conversations.first
  end
end
