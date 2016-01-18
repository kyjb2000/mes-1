class Survey < ActiveRecord::Base

  belongs_to :user
  has_many :questions, :dependent => :destroy

  accepts_nested_attributes_for :questions,
      :reject_if => ->(q) { q[:name].blank? },
      :allow_destroy => true
end
