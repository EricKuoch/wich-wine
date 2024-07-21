class FetchWinesApiService
  
  require 'rest-client'
  
  def initialize(**params)
    @url = params[:url]
    @headers = params[:headers]
  end    

  def call
      res = RestClient.get(@url, @headers)
      body = JSON.parse(res, { symbolize_names: true })
      body
  end

  
end
