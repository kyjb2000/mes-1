class Question < ActiveRecord::Base

  belongs_to :survey
  has_many   :options, :dependent => :destroy
  has_many   :answers, :dependent => :destroy

  accepts_nested_attributes_for :options,
      :reject_if => ->(q) { q[:text].blank? },
      :allow_destroy => true
  mount_uploader :image, ImageUploader
  mount_uploader :video, VideoUploader
end
