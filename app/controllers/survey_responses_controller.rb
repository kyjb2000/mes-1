class SurveyResponsesController < ApplicationController

  before_action :authenticate_user!
  before_action :find_survey, only: [ :new, :create ]

  def new
    @survey_response = SurveyResponse.new(survey: @survey)
  end

  def create
    @survey_response = SurveyResponse.new(survey_response_params)
    if @survey_response.save
      redirect_to browse_surveys_path, notice: 'Thank you for participating'
    else
      render 'new'
    end
  end

  protected

  def find_survey
    @survey ||= Survey.find(params[:survey_id])
  end

  def survey_response_params
    params[:survey_response][:user_id] = current_user.id
    params[:survey_response][:survey_id] = @survey.id

    params.require(:survey_response).permit(
        :user_id, :survey_id,
        answers_attributes: [ :question_id, :option_id ]
    )
  end

end
