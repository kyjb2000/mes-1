class AddMediaToSurveyQuestions < ActiveRecord::Migration
  def change
    add_column :survey_questions, :media, :string
  end
end
