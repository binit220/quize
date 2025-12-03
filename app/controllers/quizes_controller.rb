class QuizesController < ApplicationController
  before_action :only_admin, only: [:new, :create]
  def index
    @quizes = Quiz.all.order(created_at: :desc)
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new(quiz_params)
    @quiz.user = current_user

    respond_to do |format|
      if @quiz.save
        format.html { redirect_to quizes_path, notice: "Quiz was created successfully." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end


  private

  def quiz_params
    params.require(:quiz).permit(:title, :description)
  end

  def only_admin
    current_user = User.find(1)
    return if current_user&.admin?

    respond_to do |format|
      format.html { redirect_to quizzes_path, alert: "You are not authorized to create quizzes." }
      format.json { render json: { error: "Not authorized" }, status: :forbidden }
    end
  end
end
