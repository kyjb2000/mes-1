class Option < ActiveRecord::Base

  belongs_to :question
  has_many :answers, :dependent => :destroy

  def self.refresh_answers_count
    all.each do |option|
      option.answers_count = option.answers.count
      option.save(validate: false)
    end
  end

  def option_percentage
    if answers_count > 0
      ((answers_count.to_f/question.survey.participants_count.to_f) * 100).to_i
    end

  end

end
