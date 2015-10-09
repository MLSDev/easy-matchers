module Easy
  module Matchers
    module Validations
      def validate_confirmation_of(field)
        ValidateConfirmationOfMatcher.new(field)
      end

      class ValidateConfirmationOfMatcher < HaveValidationMatcher
        include WithMessage

        def initialize(name)
          super(name, :confirmation)
        end

        def matches?(actual)
          @result = super(actual)

          return false unless @result

          check_expected_message if @expected_message

          @result
        end

        def with_message(message)
          @expected_message = message
          self
        end
      end
    end
  end
end
