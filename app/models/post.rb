class Post < ApplicationRecord
	after_destroy :last_words
	after_create :send_welcome_email
	belongs_to :user
	mount_uploader :image, AvatarUploader
	def use
		 puts self.body
	end	
	
 
 private

   def last_words
    logger.info "Friends applaud, the comedy is over"
 end

  def send_welcome_email
        PostMailer.notify(self).deliver
    end
end
