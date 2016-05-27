module Fieri
  class ApplicationController < ActionController::Base
    before_action :fieri_enabled?

    private

    def fieri_enabled?
      if enabled_features.include?('fieri')
        true
      else
        render status: 404, json: { status: 'error',
                                    message: 'fieri is not enabled' }
      end
    end

    def enabled_features
      ENV['FEATURES'].to_s.split(',').map(&:strip)
    end
  end
end
