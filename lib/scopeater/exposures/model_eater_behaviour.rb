module Scopeater
  module Exposures
    module ModelEaterBehaviour
    extend ActiveSupport::Concern

    protected
      def model_eater
        @_model_eater ||= model.eater
      end
    end
  end
end