class NewRegistrationService

  def initialize(params)
    Post.create(title: params[:title], body: params[:body])
  end
end
