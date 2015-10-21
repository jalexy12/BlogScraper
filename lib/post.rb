class Post
	attr_accessor :title, :date, :content

	#Attributes our post class has
	def initialize(title, date, content)
		@title = title
		@date = date
		@content = content
	end

	#The logic of displaying a post should belong to the post
	def display_post
		puts " "
		puts "#{@title}   #{@date}"
		puts "----------------"
		puts @content
		puts "----------------"
		puts " "
	end
end
