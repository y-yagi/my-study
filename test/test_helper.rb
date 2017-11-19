require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

OmniAuth.config.test_mode = true
OmniAuth.config.add_mock(:google_oauth2, 'uid' => '1', 'provider' => 'google_oauth2')

class ActiveSupport::TestCase
  fixtures :all
end
