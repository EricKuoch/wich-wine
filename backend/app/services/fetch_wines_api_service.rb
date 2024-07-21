class FetchWinesApiService
  
  require 'rest-client'
  
  def initialize(**params)
    @url = url
    @headers = {
      'content-type': "application/json",
      'x-apikey': "-------",
      'cache-control': "no-cache"
    }
  end    

  def call
      res = RestClient.get(@url, @headers)
      body = JSON.parse(res, { symbolize_names: true })
      body
  end

  
end
