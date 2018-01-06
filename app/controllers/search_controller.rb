class SearchController < ApplicationController

  def index
    @stores_total = StorePresenter.new(params[:search]).stores.count
    @stores = StorePresenter.new(params[:search])
      .stores
      .paginate(:page => params[:page], :per_page => 10)
  end

end
