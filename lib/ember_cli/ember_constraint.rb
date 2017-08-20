module EmberCli
  class EmberConstraint
    def matches?(request)
      html_request?(request) && !rails_info_request?(request)
    end

    private

    def rails_info_request?(request)
      request.fullpath.start_with?("/rails/info", "/rails/mailers")
    end

    def html_request?(request)
      request.format.html? || request.format.to_s == "*/*"
    end
  end
end
