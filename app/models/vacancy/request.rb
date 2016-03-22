class Vacancy::Request < ActiveRecord::Base
  belongs_to :vacancy
  belongs_to :user
end
