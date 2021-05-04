class SearchController < ApplicationController
  def index
      if params['location']
          @response = Openbrewerydb::Search.by_location(params['location'])
          require 'json'
          @parsed_json = JSON.parse(@response.body)

          if @parsed_json.length == 0
            redirect_to root_path, alert: 'Search returned no results'
          end
      end
  end

  def show
        @response = Openbrewerydb::Search.by_id(params[:id])
        @brewery = JSON.parse(@response.body)
        @comments = Comment.select('comments.*').where('comments.brewery_id = :search', search: @brewery["id"])
        @comment = Comment.new
  end
end