class SurveyResponse < ActiveRecord::Base

  belongs_to :user
  belongs_to :survey

  has_many :answers, inverse_of: :survey_response
  accepts_nested_attributes_for :answers

  validates :survey, presence: true

  after_create :increment_survey_participants
  after_destroy :decrement_survey_participants

  protected

  def increment_survey_participants
    survey.increment!(:answers_count)
  end

  def decrement_survey_participants
    survey.decrement!(:answers_count)
  end

end
