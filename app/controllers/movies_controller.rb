class MoviesController < ApplicationController
  before_filter :init_client

  def index
  	@dvds = @bf.lists.new_dvd_releases
    @theaters = @bf.lists.in_theaters
    @upcoming_dvds = @bf.lists.upcoming_dvd_releases
  end

  def new_dvds
  	@movies = @bf.lists.new_dvd_releases
  end

  def theaters
  	@movies = @bf.lists.in_theaters
  end

  def upcoming_dvds
  	@movies = @bf.lists.upcoming_dvd_releases
  end


  def show
  	@movie = @bf.movies.search_by_id(params[:id])
  end

  protected
  	def init_client
  		@bf = BadFruit.new('5p4tvx77umsuxeq5meaxzjz6')
  	end
end

