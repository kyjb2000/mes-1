class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /answers
  def index
    if !params[:q].nil?
      key = params[:q][:key_cont]
      @survey = Survey.where(key: key).first
      if @survey.nil?
        redirect_to browse_surveys_path
      end
    end
    @answer = Answer.new
  end

  # GET /answers/1
  def show
  end

  # GET /answers/new
  def new
    @answer = Answer.new
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers
  def create
    question_id = params[:answer][:question_id].to_i
    option_id = params[:answer][:option_id].to_i
    @answer = Answer.new
    @answer.question_id = question_id
    @answer.option_id = option_id
    if @answer.save
      redirect_to browse_surveys_path, notice: 'Thank you for participating'
    else
      render :new
    end
  end

  # PATCH/PUT /answers/1
  def update
    if @answer.update(answer_params)
      redirect_to @answer, notice: 'Answer was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /answers/1
  def destroy
    @answer.destroy
    redirect_to answers_url, notice: 'Answer was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def answer_params
      params.require(:answer).permit(:title, :description, :question_id, :option_id, :text, :question => [])
    end
end
