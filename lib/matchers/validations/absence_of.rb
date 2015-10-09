module Easy
  module Matchers
    module Validations
      def validate_absence_of(field)
        ValidateAbsenceOfMatcher.new(field)
      end

      class ValidateAbsenceOfMatcher < HaveValidationMatcher
        include WithMessage

        def initialize(name)
          super(name, :absence)
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
