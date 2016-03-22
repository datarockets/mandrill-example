class VacanciesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]

  def index
    @vacancies = Vacancy.order(created_at: :desc)
  end

  def show
    @vacancy = Vacancy.find(params[:id])
  end

  def new
    @vacancy = Vacancy.new
  end

  def create
    @vacancy = Vacancy.new(vacancy_params)
    @vacancy.user = current_user
    if @vacancy.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

    def vacancy_params
      params.require(:vacancy).permit(:title)
    end
end
