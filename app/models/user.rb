class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_messageable

  extend Enumerize

  enumerize :role, in: [:employer, :applicant], default: :applicant, predicates: true

  has_many :vacancies

  has_many :vanancy_requests, class_name: 'Vacancy::Request'

  def mailboxer_email(object)
    email
  end
end
