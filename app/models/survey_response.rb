class SurveyResponse < ActiveRecord::Base

  belongs_to :user
  belongs_to :survey

  has_many :answers, inverse_of: :survey_response
  accepts_nested_attributes_for :answers

  validates :survey, presence: true

end
