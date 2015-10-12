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

        def on(context)
          options[:on] = context
          self
        end

        # TODO: add support
        # There is also a list of default options supported by every validator:
        # +:if+, +:unless+, +:on+, +:allow_nil+, +:allow_blank+, and +:strict+.
        # See <tt>ActiveModel::Validation#validates</tt> for more information
      end
    end
  end
end
