class MyPost
	def initialize(_attrs = {})
		puts "Object Initialize"
		private_method
		protected_method
		public_method
	end

	protected
	def protected_method
		puts "protected"
	end
	public
	def public_method
		puts "public"
	end

	private
	def private_method
		puts "private"
	end
end	