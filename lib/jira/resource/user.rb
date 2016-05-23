module JIRA
  module Resource

    class UserFactory < JIRA::BaseFactory # :nodoc:
    end

    class User < JIRA::Base
      def self.all(client, options = {})
        url = client.options[:rest_base_path] + "/user/search"
        url = "#{url}?#{options.map { |k, v| CGI.escape(k.to_s)+"="+CGI.escape(v.to_s) }.join("&")}"
        puts url
        response = client.get(url)
        json = parse_json(response.body)
        json.map do |user|
          client.User.build(user)
        end
      end

      def self.singular_path(client, key, prefix = '/')
        collection_path(client, prefix) + '?username=' + key
      end

      def add_application(applicationKey)
        addapplication_url = client.options[:rest_base_path] + "/#{self.class.endpoint_name}/application?"
        addapplication_url << "username=#{CGI.escape(name.to_s)}&applicationKey=#{CGI.escape(applicationKey.to_s)}"
        client.post(addapplication_url, '')
        true
      end
    end

  end
end
