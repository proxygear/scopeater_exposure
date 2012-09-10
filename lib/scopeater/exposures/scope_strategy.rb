module Scopeater
  module Exposures
    class ScopeStrategy < DecentExposure::Strategy
      include ScopeHookBehaviour

      def resource
        apply_finder_on hooked_scope
      end

      def apply_finder_on eater
        if options[:finder]
          eater.content.send options[:finder]
        else
          eater
        end
      end

      def scope_hooker
        controller
      end
    end
  end
end