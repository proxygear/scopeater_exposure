module Scopeater
  module Exposures
    module ScopeHookBehaviour
      extend ActiveSupport::Concern

      included do
        class_eval do
          include ModelEaterBehaviour
        end
      end

    protected
      def scope_hooker= delegate
        @scope_hooker = delegate
      end

      def scope_hooker
        @scope_hooker ||= controller
      end

      def hooked_scope
        @hooked_scope ||= hooks_to model_eater
      end

      def hooks_to eater
        if scope_hooks
          scope_hooks.each do |hook|
            scope_hooker.send hook, eater
          end
        end
        eater
      end

      def scope_hooks
        @_scope_hooks ||= get_scope_hooks
      end

      def get_scope_hooks
        if options[:scope_hooks]
          _scopes = options[:scope_hooks]
          _scopes = [_scopes] unless _scopes.kind_of?(Array)
          _scopes
        else
          false
        end
      end
    end
  end
end