ActiveAdmin.register Post do
	decorate_with PostDecorator

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :post, :of, :title, :body , :user_id, :image ,:on, :model
actions :index, :show, :create, :edit, :new, :destroy
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

# controller do
#   def create
#      @post = Post.new(title: params[:post][:title], body: params[:post][:body],user_id: params[:post][:user_id])
#     @post.user.id = current_user.id
#     super
#   end 
# end

#  controller do
#    def edit
#    	byebug
#     end 
# end

form(:html => { :multipart => true }) do |f|
  f.inputs do
    f.input :title
    f.input :body, :as => :ckeditor
     # f.input :user_id
    f.input :user_id, :as => :select, :collection => User.all.collect {|product| [product.email, product.id] }
    f.input :image, :as => :file
  end
  f.actions
end




 show do
     attributes_table do 
        row :title
        row  :body do |ad|
         raw(ad.body)	
        end	
        row :user_id
      row :image
    end
end

index do
  column :title
   column :body do |ad|
   	 raw(ad.body)
   end
  actions 
end


end


