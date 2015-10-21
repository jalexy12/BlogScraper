require 'date'
require 'nokogiri'
require 'open-uri'
require_relative './lib/post.rb'
require_relative './lib/blog.rb'
require_relative './lib/sponsered_post.rb'

$TODAY = Date.today
robots = Blog.new
robots.publish

input = ""
while input != "exit"
	puts "next for next page, prev for previous page, exit to exit"
	input = gets.chomp
	if input == "next"
		#Bonus: clear the terminal before publishing, only see the posts you selected
		system "clear" or system "cls"
	  robots.next_page
	elsif input == "prev"
		system "clear" or system "cls"
	  robots.prev_page
	elsif input != "exit"
		puts "Command not recognized"
	end
end
