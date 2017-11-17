module PostsHelper
	def getAllPosts
		@all_post = Post.all
	end

	def last_five
		getAllPosts.order("created_at desc").limit(5)
	end
end
