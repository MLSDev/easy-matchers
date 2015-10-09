module RSpec
  module Rails
    module ActiveModel
      module Validations
        module Matchers
          def validate_acceptance_of(field)
            HaveValidationMatcher.new(field, :acceptance)
          end
        end
      end
    end
  end
end
