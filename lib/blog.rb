require_relative './blog_parser.rb'
class Blog
	def initialize
		@posts = BlogParser.new("https://robots.thoughtbot.com").create_posts
		@current_posts = []
		@page = 0
		@posts_per_page = 4
	end
	#Post Adding Logic
	#Add a post to the blog
	def add_post(post)
		@posts.push(post)
	end

	#Bonus stuff, just an FYI for students
	def add_a_bunch_of_posts(*args)
		args.each do | post |
			@posts.push(post)
		end
	end
	#End Post adding logic
	#All of the pagination logic
	def pages
	  (@posts.length / @posts_per_page).ceil
	end

	def is_last_page?
		@page >= (@posts.length / @posts_per_page).ceil
	end

	def is_first_page?
		@page == 0
	end

	def prev_page
		if !is_first_page?
			@page -= 1
			self.publish
		else
			self.publish
		end
	end

	def next_page
		if !is_last_page?
			@page += 1
			self.publish
		else
			self.publish
		end
	end

	def pagination_section
		(0..pages).each do | page |
			actual_page = page + 1
			if page == @page
				print "[#{actual_page}] "
			else
				print "#{actual_page} "
			end
		end
		puts "\n\n"
	end
	# End of pagination logic...maybe we should include this in a module :)
	# Start of publishing & display logic
	def display(posts)
		posts.each do | post |
			post.display_post
		end
		#print the pagination
		pagination_section
	end

	#Order our posts by date and return them
	def posts_ordered_by_date
		@current_posts.sort! { | post1, post2 | post1.date <=> post2.date }
	end

	#Take our ordered posts, order them by date, and display them.
	def publish
		first_post = @page * @posts_per_page
		last_post = first_post + @posts_per_page - 1
		@current_posts = @posts[first_post..last_post]
		display(posts_ordered_by_date)
	end

end
