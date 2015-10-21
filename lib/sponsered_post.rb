require_relative './post.rb'

class SponsoredPost < Post
	#Lets inherit and just override the display method from our post class
	def display_post
		puts " "
		puts "********* #{@title}   #{@date} *********"
		puts "*" * @title.length
		puts @content
		puts "-" * @content.length
		puts " "
	end
end
