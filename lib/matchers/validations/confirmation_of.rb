module Easy
  module Matchers
    module Validations
      def validate_confirmation_of(*attributes)
        ValidateConfirmationOfMatcher.new(attributes)
      end

      class ValidateConfirmationOfMatcher < BaseValidationMatcher
        attr_reader :confirmation_attributes

        def initialize(attributes)
          super(attributes, :confirmation)
          @confirmation_attributes = attributes
        end

        def matches?(subject)
          super(subject)

          matched_validator = class_name.validators.detect do |validator|
            validator.kind == type &&
              validator.attributes.sort == attributes.sort &&
              validator.options.sort == options.sort
          end

          true if matched_validator
        end

        def description
          "require #{ confirmation_attributes.join(', ') } to match #{ attributes.join(', ') }"
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

        def allow_nil(value = true)
          options[:allow_nil] = value
          self
        end

        def allow_blank(value = true)
          options[:allow_blank] = value
          self
        end

        def strict
          raise NotImplementedError
        end
      end
    end
  end
end
