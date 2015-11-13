module Easy
  module Matchers
    module Validations
      def validate_numericality_of(*attributes)
        ValidateNumericalityOfMatcher.new(attributes)
      end

      class ValidateNumericalityOfMatcher < BaseValidationMatcher
        def initialize(attributes)
          super(attributes, :numericality)
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
          "require #{ attributes.join(', ') } to be numeric"
        end

        def with_message(message)
          options[:message] = message
          self
        end

        def if(symbol_name)
          options[:if] = symbol_name
          self
        end

        def unless(symbol_name)
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

        def only_integer(value = true)
          options[:only_integer] = value
          self
        end

        def is_greater_than(value)
          options[:greater_than] = value
          self
        end

        def is_greater_than_or_equal_to(value)
          options[:greater_than_or_equal_to] = value
          self
        end

        def is_equal_to(value)
          options[:equal_to] = value
          self
        end

        def is_less_than(value)
          options[:less_than] = value
          self
        end

        def is_less_than_or_equal_to(value)
          options[:less_than_or_equal_to] = value
          self
        end

        def is_other_than(value)
          options[:other_than] = value
          self
        end

        def even(value = true)
          options[:even] = value
          self
        end

        def odd(value = true)
          options[:odd] = value
          self
        end
      end
    end
  end
end
