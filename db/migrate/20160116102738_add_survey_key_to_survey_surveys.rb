class AddSurveyKeyToSurveySurveys < ActiveRecord::Migration
  def change
    add_column :survey_surveys, :survey_key, :string
  end
end
