module Openbrewerydb
    class Search
      def self.by_location(location)
        Faraday.get 'https://api.openbrewerydb.org/breweries?by_city=' + location
      end

      def self.by_name(name)
        Faraday.get 'https://api.openbrewerydb.org/breweries?by_name=' + name
      end

      def self.by_id(id)
        Faraday.get 'https://api.openbrewerydb.org/breweries/' + id
      end

      def self.image(query)
        Faraday.get('https://api.bing.microsoft.com/v7.0/images/search', {q: query}, {'Ocp-Apim-Subscription-Key' => '2af9f692d5c242e697ce8bf098e0b1c6'})
      end
    end
  end