class BestBuyStore
  attr_reader :long_name, :city, :distance, :phone_number, :store_type

  def initialize(attributes = {})
    @long_name = attributes[:longName]
    @city = attributes[:city]
    @distance = attributes[:distance]
    @phone_number = attributes[:phone]
    @store_type = attributes[:storeType]
  end

  def self.stores_by_zip(zip,miles)
    BestBuyService.stores_by_zip(zip,miles).map do |raw_store|
      new(raw_store)
    end
  end

end
