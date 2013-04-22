class CelebritiesController < ApplicationController
  def index
  end

  def show
	@people = Tmdb::People.detail(params[:id])  	
  end
end
