module Easy
  module Matchers
    module Validations
      def validate_acceptance_of(*attributes)
        ValidateAcceptanceOfMatcher.new(attributes)
      end

      class ValidateAcceptanceOfMatcher < BaseValidationMatcher
        def initialize(attributes)
          super(attributes, :acceptance)
        end

        def matches?(subject)
          super(subject)

          add_allow_nil_and_accept_to_options

          matched_validator = class_name.validators.detect do |validator|
            validator.kind == type &&
            validator.attributes.sort == attributes.sort &&
            validator.options.sort == options.sort
          end

          true if matched_validator
        end

        def description
          "require #{ attributes.join(', ') } to be accepted"
        end

        def with_message(message)
          options[:message] = message
          self
        end

        def if(&block)
          # block.call == options[:if].call

          raise NotImplementedError
        end

        def unless
          raise NotImplementedError
        end

        def on(context)
          options[:on] = context
          self
        end

        def allow_nil
          options[:allow_nil] = true
          self
        end

        def allow_blank
          raise NotImplementedError
        end

        def strict
          raise NotImplementedError
        end

        private

        # TODO: check :allow_nil and :accept before setting
        # NOTE: Rails adds this to options by defaults
        def add_allow_nil_and_accept_to_options
          options[:allow_nil] = true
          options[:accept] = '1'
        end
      end
    end
  end
end
