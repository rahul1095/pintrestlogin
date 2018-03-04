class PostDecorator < Draper::Decorator
	 delegate_all
  def body_show
  	 @object.body.present? ? @object.body : nil
  end

  def title_show
  	 @object.title.present? ? @object.title : nil
  end
 
  def tbody
  	@object.title.present? ? "Titlele  " +@object.title+" "+ @object.body : nil 
  	end 

    def image
     if model.image_url.present? 
       h.image_tag self.image_url, height: 200, width: 300
     else
        h.image_tag "http://via.placeholder.com/350x150" , height: 200, width: 300
      end
    end

    def user_eamil
      self.user.email
    end
      
end