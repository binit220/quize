class QuestionsController < ApplicationController
  before_action :set_quiz
  before_action :only_admin, only: [:new, :create]

  def new
    @question = Question.new
  end

  def create
    @question = @quiz.questions.new(question_params)
    if @question.save
      redirect_to new_quiz_question_option_path(@quiz, @question), notice: "Question created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def only_admin
    current_user = User.find(1)
    return if current_user&.admin?

    respond_to do |format|
      format.html { redirect_to root_path, alert: "You are not authorized to create quizzes and question." }
      format.json { render json: { error: "Not authorized" }, status: :forbidden }
    end
  end


  def set_quiz
    @quiz = Quiz.find(params[:quiz_id])
  end

  def question_params
    params.require(:question).permit(:title, :question_type) # see rename note below
  end
end
