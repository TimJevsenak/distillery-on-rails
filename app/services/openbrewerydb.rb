module Openbrewerydb
    class Search
      def self.by_location(location)
        Faraday.get 'https://api.openbrewerydb.org/breweries?by_city=' + location
      end

      def self.by_id(id)
        Faraday.get 'https://api.openbrewerydb.org/breweries/' + id
      end
    end
  end