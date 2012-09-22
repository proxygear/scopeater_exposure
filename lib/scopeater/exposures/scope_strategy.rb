module Scopeater
  module Exposures
    class ScopeStrategy < DecentExposure::Strategy
      include ScopeHookBehaviour

      delegate :plural?, :parameter, :to => :inflector

      def collection
        inflector.plural.to_sym
      end

      def finder
        options[:finder] || :find
      end

      def collection_resource
        hooked_scope
      end

      def id
        if finder_parameter
          params[finder_parameter]
        else
          params[parameter]
        end
      end

      def finder_parameter
        options[:finder_parameter] || :id
      end

      def singular_resource
        if id
          hooked_scope.send(finder, id)
        else
          hooked_scope.new
        end
      end

      def raw_resource
        if plural?
          collection_resource
        else
          singular_resource
        end
      end
      
      def resource
        decorate raw_resource
      end
      
      def decorate source
        if options[:decorator]
          decorator.new source
        else
          source
        end
      end
      
      def scope_hooker
        controller
      end
    end
  end
end