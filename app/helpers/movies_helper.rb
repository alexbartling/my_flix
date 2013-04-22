module MoviesHelper

	def tmdb_detail(id)
		@tmdb_detail = Tmdb::Movie.detail(id)
	end

	def movie_image(poster_path)
		@movie_image = 'http://d3gtl9l2a4fn1j.cloudfront.net/t/p/w185' + (poster_path)
	end

end
