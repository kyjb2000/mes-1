class Question < ActiveRecord::Base

  belongs_to :survey
  has_many   :options, :dependent => :destroy
  has_many   :answers, :dependent => :destroy
end
