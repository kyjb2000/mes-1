class AddSurveyResponseIdToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :survey_response_id, :integer
  end
end
