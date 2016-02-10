class Survey < ActiveRecord::Base

  belongs_to :user
  has_many :questions, :dependent => :destroy
  has_many :survey_responses

  accepts_nested_attributes_for :questions,
      :reject_if => ->(q) { q[:name].blank? },
      :allow_destroy => true

  def self.refresh_participants_count
    all.each do |survey|
      survey.participants_count = survey.survey_responses.count
      survey.save(validate: false)
    end
  end

end
