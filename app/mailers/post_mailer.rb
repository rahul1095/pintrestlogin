class PostMailer < ApplicationMailer

  def notify(post)
  	@post =post
    mail to: "rahul@bittern.co"
  end
end
