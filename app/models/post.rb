class Post < ApplicationRecord
	after_destroy :last_words
	after_create :send_welcome_email
	belongs_to :user , optional: true
	mount_uploader :image, AvatarUploader
  around_create :my_callback_method
  around_save :around_save_method
  validates :title, presence: true


after_initialize do |post| 
    puts "You have initialized an object!"
  end

  # after_find do |post|
  #   puts "You have found an object!"
  # end

after_touch do |post|
    puts "You have touched an object"
  end

 extend FriendlyId
  friendly_id :title, use: :slugged

 
	def use
		 puts self.body
	end	
	

  

 private

 #   def last_words
 #    logger.info "Friends applaud, the comedy is over"
 # end

  def send_welcome_email
        PostMailer.notify(self).deliver
    end

def around_save_method
    puts 'in around save'
    yield # User saved
    puts 'out around save'
  end

  def my_callback_method
     puts  "this call around create2"
      yield  # this makes the save happen
    puts  "this call around create"
    end

end


