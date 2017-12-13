class SearchController < ApplicationController
  def index
    @stations = Station.all(params["q"])
  end
end
