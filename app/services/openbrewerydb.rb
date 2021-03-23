module Openbrewerydb
    class Search
      def self.by_location(location)
        Faraday.get 'https://api.openbrewerydb.org/breweries?by_city=' + location
      end
    end
  end