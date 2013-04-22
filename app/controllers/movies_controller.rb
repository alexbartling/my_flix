class MoviesController < ApplicationController
  before_filter :badfruit, :moviedb

  def index
  	@dvds = @bf.lists.new_dvd_releases
    @theaters = @bf.lists.in_theaters
    @upcoming_dvds = @bf.lists.upcoming_dvd_releases
  end

  

  def new_dvds
  	@movies = @bf.lists.new_dvd_releases
  end

  def theaters
  	@movies = Tmdb::Movie.now_playing
  end

  def upcoming_dvds
  	@movies = Tmdb::Movie.upcoming
  end

  def top_rated
    @movies = Tmdb::Movie.top_rated
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

