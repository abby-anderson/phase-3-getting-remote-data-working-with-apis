require 'net/http'
require 'open-uri'
require 'json'

class GetJSONFromURL

    URL = "https://api.nasa.gov/planetary/apod?api_key=u71Jk7NxmlHqS1XYpPNEHBP0KlqVHqg8qiaWsHpd&count=100"

    def get_response_body
        uri = URI.parse(URL)
        response = Net::HTTP.get_response(uri)
        response.body
    end

    def parse_json_title
        nasa_data = JSON.parse(self.get_response_body)
        nasa_data.collect do |nasa_data|
            nasa_data["title"]
        end
    end

end

titles = GetJSONFromURL.new
puts titles.parse_json_title