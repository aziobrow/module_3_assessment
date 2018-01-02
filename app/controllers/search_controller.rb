class SearchController < ApplicationController

  def index
    @stores = Store.nearest_stores(params[:search])
  end

end
