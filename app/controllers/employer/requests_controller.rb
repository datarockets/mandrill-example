class Employer::RequestsController < RequestsController
  private

    def set_requests
      @requests = Vacancy::Request
        .joins(:vacancy)
        .includes(:vacancy, :user)
        .where(vacancies: {user_id: current_user.id})
        .order(created_at: :desc)
    end
end
