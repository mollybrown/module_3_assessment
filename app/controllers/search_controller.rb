class SearchController < ApplicationController

  def search
    @stores = BestBuyStore.stores_by_zip(params[:search])
  end

end
