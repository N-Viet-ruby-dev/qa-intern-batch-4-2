class QuestionsController < ApplicationController
  before_action :load_question, except: [:index, :new, :create]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :logged_in_user, except: [:index, :show]

  def index
    @questions = current_user.questions.newest.paginate page: params[:page], per_page: 5
  end

  def show
    rows = @question.answers.newest.includes(:user)
    @answers = Kaminari.paginate_array(rows).page(params[:page]).per(5)
    @answer = @question.answers.build
  end

  def new
    @question = current_user.questions.new
  end

  def create
    @question = current_user.questions.new question_params
    if @question.save
      redirect_to root_path, success: "Create successfully!"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @question.update question_params
      redirect_to @question, success: "Updating are successful!"
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_path, success: "Deleting are successful!"
  end

  private

  def question_params
    params.require(:question).permit :category_id, :title, :content, tag_ids: []
  end

  def load_question
    @question = Question.find_by id: params[:id]
    return if @question
    redirect_to root_path, danger: "Question Errors"
  end

  def correct_user
    return if current_user?(@question.user)
    redirect_to root_path, danger: "No Permission"
  end
end
