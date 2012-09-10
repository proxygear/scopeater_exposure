require 'rspec'
require './spec/support/fake_mongoid.rb'

require 'scopeater_exposure'

require './spec/support/fake_mongoid_models.rb'
require './spec/support/fake_controller.rb'

RSpec.configure do |config|
  config.color_enabled = true
  config.formatter     = 'documentation'
end