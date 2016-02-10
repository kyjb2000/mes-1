class Answer < ActiveRecord::Base

  belongs_to :survey_response
  belongs_to :option
  belongs_to :question

  validates :question, :option, presence: true

  after_create :increment_option_answers_count
  after_destroy :decrement_option_answers_count

  protected

  def increment_option_answers_count
    option.increment!(:participants_count)
  end

  def decrement_option_answers_count
    option.decrement!(:participants_count)
  end


end
