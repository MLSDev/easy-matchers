module Easy
  module Matchers
    module Validations
      def validate_presence_of(*attributes)
        ValidatePresenceOfMatcher.new(attributes)
      end

      class ValidatePresenceOfMatcher < BaseValidationMatcher
        def initialize(attributes)
          super(attributes, :presence)
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
          "require #{ attributes.join(', ') } to be set"
        end

        def with_message(message)
          options[:message] = message
          self
        end

        def with_if(symbol_name)
          options[:if] = symbol_name
          self
        end

        def with_unless(symbol_name)
          options[:unless] = symbol_name
          self
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

        def strict(value)
          options[:strict] = value
          self
        end
      end
    end
  end
end
