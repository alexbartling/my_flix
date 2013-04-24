class CelebritiesController < ApplicationController
  def index
  end

  def show
	@people = Tmdb::People.detail(params[:id])  	
  	@career = Tmdb::People.credits(@people.id)['cast'].sort_by { |movie| movie["release_date"].to_s}
  end
end
