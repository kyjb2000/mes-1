class SurveysController < ApplicationController

  before_filter :load_survey, :only => [:show, :edit, :update]

  def index
    @surveys = Survey::Survey.where(user_id: current_user.id)
  end

  def new
    @survey = Survey::Survey.new
  end

  def create
    @survey = Survey::Survey.new(survey_params)
    @survey.user_id = current_user.id

    if @survey.valid? && @survey.save
      @survey.survey_key = @survey.id.to_s + current_user.id.to_s + rand.to_s[2..5]
      @survey.save
      puts 'Testting###',   @survey.survey_key
      default_redirect
    else
      render :action => :new
    end
  end

  def edit
  end

  def show
  end

  def update
    if @survey.update_attributes(survey_params)
      default_redirect
    else
      render :action => :edit
    end
  end

  private

  def default_redirect
    redirect_to surveys_path, alert: I18n.t("surveys_controller.#{action_name}")
  end

  def load_survey
    @survey = Survey::Survey.find(params[:id])
  end

  def survey_params
    rails4? ? params_whitelist : params[:survey_survey]
  end

  def params_whitelist
    params.require(:survey_survey).permit(Survey::Survey::AccessibleAttributes)
  end

end
