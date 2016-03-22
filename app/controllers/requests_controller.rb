class RequestsController < ApplicationController
  before_action :set_requests, except: :create
  before_action :authenticate_user!

  def show
    @current_request = @requests.find(params[:id])
  end

  def index
    @current_request = @requests.first
    render :show
  end

  def create
    @request = Vacancy::Request.create(user: current_user, vacancy_id: params[:vacancy_id])
    redirect_to :back
  end

  private

    def set_requests
      @requests = current_user.vanancy_requests.includes(:vacancy).order(created_at: :desc)
    end
end
