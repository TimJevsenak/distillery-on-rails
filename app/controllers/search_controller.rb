class SearchController < ApplicationController
  def index
      if params['location']
          @response = Openbrewerydb::Search.by_location(params['location'])
          require 'json'
          @parsed_json = JSON.parse(@response.body)
      end
  end
end