class SearchController < ApplicationController
  def index
  	search = Tmdb::Search.new	
  	search.resource('movie')
  	search.query(params[:search])
  	@movies = search.fetch
  	search.resource('person')
  	@people = search.fetch
  end
end
