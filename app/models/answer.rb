class Answer < ActiveRecord::Base

  belongs_to :option
  belongs_to :question
  accepts_nested_attributes_for :option
end
