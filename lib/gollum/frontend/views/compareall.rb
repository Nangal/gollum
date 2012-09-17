require 'gollum/frontend/views/compare'

module Precious
  module Views
    class Compareall < Layout
      include HasPage
      
      attr_reader :versions, :pages

      def title
        "Comparison of #{@versions.first}...#{@versions.last}"
      end

      def meow
        result = []
        for page in @pages
            view = Compare.new
            view.page = page.page
            view.diff = page.diff
            view.versions = @versions
            view.message = ''
            result << view.render
        end
        result
      end
    end
  end
end
