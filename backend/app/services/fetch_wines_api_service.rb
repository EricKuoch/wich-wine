class FetchWinesApiService
  
  require 'rest-client'
  
  def initialize(**params)
    @url = params[:url]
    @headers = params[:headers]
    @logger = Logger.new(STDOUT)
  end    

  def call
      res = RestClient.get(@url, @headers)
      if res.code == 200
        JSON.parse(res, { symbolize_names: true })
      else
        @logger.error 'Request failed'
      end
  end

  
end
