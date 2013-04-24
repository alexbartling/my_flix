module ApplicationHelper

	def moviedb_image(image_path)
		@moviedb_image = 'http://d3gtl9l2a4fn1j.cloudfront.net/t/p/w185' + image_path.to_s
	end

	def missing_image
		@image = 'http://d3a8mw37cqal2z.cloudfront.net/assets/91c0541cff7ec49/images/no-profile-w185.jpg'
	end
end
