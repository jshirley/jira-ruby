module JIRA
  module Resource

    class ProjectcategoryFactory < JIRA::BaseFactory # :nodoc:
    end

    class Projectcategory < JIRA::Base
      def self.endpoint_name
        'projectCategory'
      end

    end
  end
end
