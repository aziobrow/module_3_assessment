class SearchController < ApplicationController

  def index
    @stores_total = Store.nearest_stores(params[:search]).count
    @stores = Store.nearest_stores(params[:search]).paginate(:page => params[:page], :per_page => 10)
  end

end
