
module Taggable
 extend ActiveSupport::Concern

  included do
     belongs_to :user , optional: true
  end  

  private
  
     def last_words
      logger.info "Friends applaud, the comedy is over"
   end

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

  def validation_method
   puts  "this method call at a time of validation"
  end
end

