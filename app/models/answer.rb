class Answer < ActiveRecord::Base

  belongs_to :survey_response
  belongs_to :option
  belongs_to :question

  validates :question, :option, presence: true
end
