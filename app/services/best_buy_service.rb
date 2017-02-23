class BestBuyService

  def self.stores_by_zip(zip)
    response = Faraday.get("https://api.bestbuy.com/v1/stores?format=json&zip=80302&show=city,longName,distance,phone,storeType&apiKey=a8k7nnexb87aa9hb3zzqbgf7")
    JSON.parse(response.body, symbolize_names: true)
  end

end
