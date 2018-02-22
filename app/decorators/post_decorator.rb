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
end