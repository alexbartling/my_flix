class MoviesController < ApplicationController
  before_filter :badfruit, :moviedb

  def index
  	@movies = Tmdb::Movie.now_playing

  end

  

  def top_rated
  	@movies = Tmdb::Movie.top_rated
  end

  def popular
    @movies = Tmdb::Movie.popular
  end

  def now_playing
  	@movies = Tmdb::Movie.now_playing
  end

  def upcoming_dvds
  	@movies = Tmdb::Movie.upcoming
  end

  


  def show
  	@movie = Tmdb::Movie.detail(params[:id])
    @trailer = Tmdb::Movie.trailers(@movie.id)
    if !@trailer['youtube'].empty?
      @youtube = "http://www.youtube.com/embed/#{@trailer['youtube'].first['source']}"  
    end
  end

  protected
  	
    def badfruit
  		@bf = BadFruit.new(ENV['ROTTEN_TOMATOES_KEY'])
  	end

    def moviedb
      Tmdb::Api.key(ENV["MOVIE_DB_KEY"])
      @search = Tmdb::Search.new
    end
end

