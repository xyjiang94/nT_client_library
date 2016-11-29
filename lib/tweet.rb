class Tweet
    class << self; attr_accessor :base_uri end

    def self.find_by_id(id)
        response = Typhoeus::Request.get("#{base_uri}/api/v1/tweets/#{id}")
        if response.code == 200
          JSON.parse(response.body)
        elsif response.code == 400 || response.code == 404
          nil
        else
          puts response.code
        end
      end

      def self.create_tweet(id, content)
          puts "start"
          response = Typhoeus::Request.put("#{base_uri}/api/v1/users/#{id}/tweets/#{content}")
          parse_response(response)
        end

end
