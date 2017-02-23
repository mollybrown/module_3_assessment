class BestBuyStore
  attr_reader: :long_name, :city, :distance, :phone_number, :store_type

  def initialize(attributes = {})
    @long_name = attributes
    @city = attributes
    @distance = attributes
    @phone_number = attributes
    @store_type
  end

  def self.stores_by_zip(zip)
    BestBuyService.stores_by_zip(zip).map do |raw_stores|
      new(raw_stores)
    end
  end

end
