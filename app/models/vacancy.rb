class Vacancy < ActiveRecord::Base
  belongs_to :user

  has_many :requests

  def has_request?(user)
    requests.find_by(user: user).present?
  end
end
