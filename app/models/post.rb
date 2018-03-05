class Post < ApplicationRecord
 
  after_create :send_welcome_email
  after_destroy :last_words
  before_validation :validation_method
  mount_uploader :image, AvatarUploader
  around_create :my_callback_method
  around_save :around_save_method
  validate :title, :body, presence: :true

  include Taggable
  extend FriendlyId
  friendly_id :title, use: :slugged

  def use
     puts self.body
  end 
end



