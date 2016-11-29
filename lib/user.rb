class User
  class << self; attr_accessor :base_uri end

    def self.find_by_id(id)
      response = Typhoeus::Request.get("#{base_uri}/api/v1/users/#{id}")
      parse_response(response)
    end

    def self.find_by_name(name)
      response = Typhoeus::Request.get("#{base_uri}/api/v1/users/name/#{name}")
      parse_response(response)
    end


    def self.delete_by_name(name)
      response = Typhoeus::Request.delete("#{base_uri}/api/v1/users/#{name}")
      parse_response(response)
    end


    def self.create(name,password)
      response = Typhoeus::Request.put("#{base_uri}/api/v1/users/create/#{name}/#{password}")
      parse_response(response)
    end

    def self.UpdateProfile (id, attributes)
      response = Typhoeus::Request.put("#{base_uri}/api/v1/users/#{id}/UpdateProfile", :body => attributes.to_json)
      parse_response(response)
    end

    def self.followers(id)
      response = Typhoeus::Request.get("#{base_uri}/api/v1/users/#{id}/followers/")
      parse_response(response)
    end

    def self.followings(id)
      response = Typhoeus::Request.get("#{base_uri}/api/v1/users/#{id}/followings/")
      parse_response(response)
    end

    def self.to_follow(user_id, followed_user_id)
      response = Typhoeus::Request.put("#{base_uri}/api/v1/users/#{user_id}/follow/#{followed_user_id}")
      parse_response(response)
    end

    def self.create_tweet(id, content)
        puts "start"
        response = Typhoeus::Request.put("#{base_uri}/api/v1/users/#{id}/tweets/#{content}")
        parse_response(response)
      end

  end

def parse_response (response)
  if response.code == 200
    JSON.parse(response.body)
  elsif response.code == 400 || response.code == 404
    nil
  else
    puts response.code
  end
end
