require 'active_support'

module Mongoid
  module Document
    extend ::ActiveSupport::Concern
  end
  
  module EmbeddedDocument
    extend ::ActiveSupport::Concern
  end

  class Criteria
    def initialize *a
    end
    
    def klass
      MongoidModel
    end
    
    def missing_method name, *arg, &block
      klass.send name, *arg, &block
    end
  end
end