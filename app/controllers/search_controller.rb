class SearchController < ApplicationController
  def index
    @stations = Station.all
  end
end
