class MoviesController < ApplicationController
  def index
  	bf = BadFruit.new('5p4tvx77umsuxeq5meaxzjz6')
  	@movies = bf.lists.new_dvd_releases
  end

  def show
  	bf = BadFruit.new('5p4tvx77umsuxeq5meaxzjz6')
  	@movie = bf.movies.search_by_id(params[:id])
  	#@movie = Movie.find(params[:id])
  end
end
