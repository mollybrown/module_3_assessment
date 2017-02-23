class SearchController < ApplicationController

  def search
    @stores = BestBuyStore.stores_by_zip(params[:search],25)
  end

end
