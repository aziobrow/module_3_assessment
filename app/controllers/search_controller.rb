class SearchController < ApplicationController

  def index
    @stores = Store.nearest_stores(params[:search])
    require "pry"; binding.pry
  end

end
