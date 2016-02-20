class SurveysController < ApplicationController
  before_action :set_survey, only: [:show, :edit, :update, :destroy]

  # GET /surveys
  def index
    @surveys = current_user.surveys
  end

  # GET /surveys/1
  def show
  end

  def browse

    if params[:q].present? and params[:q][:key_cont].present?
      survey = Survey.where(key: params[:q][:key_cont]).first
      if survey.present?
        redirect_to new_survey_survey_response_path(survey) and return
      end
    end

    @q = Survey.ransack(params[:q])
    @survey_results = @q.result
    if @survey_results.nil?
     redirect_to browse_surveys_path, notice: 'Survey not found!'
    end
  end

  # GET /surveys/new
  def new
    if current_user.is_active
      @survey = Survey.new
    else
      redirect_to surveys_path, notice: 'You account has been blocked, Please contact the system admin'
    end
  end

  # GET /surveys/1/edit
  def edit
    if !current_user.is_active
      redirect_to surveys_path, notice: 'You account has been blocked, Please contact the system admin'
    end
  end

  # POST /surveys
  def create
    @survey = Survey.new(survey_params)
    @survey.user_id = current_user.id

    if @survey.save
      @survey.key = @survey.id.to_s + current_user.id.to_s + rand.to_s[2..5]
      @survey.save
      redirect_to surveys_path, notice: 'Survey was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /surveys/1
  def update
    if @survey.update_attributes(survey_params)
      redirect_to @survey, notice: 'Survey was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /surveys/1
  def destroy
    @survey.destroy
    redirect_to surveys_url, notice: 'Survey was successfully destroyed.'
  end

  def report
    @survey = current_user.surveys.includes(questions: [:options]).where(id: params[:id]).first
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = Survey.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def survey_params
      params.require(:survey).permit(:title, :description, :maximum_participant, questions_attributes: [:name, :image, :video, :id, :_destroy, options_attributes: [:text, :_destroy, :id]])
    end
end
