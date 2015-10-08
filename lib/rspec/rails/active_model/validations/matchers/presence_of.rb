module RSpec
  module Rails
    module ActiveModel
      module Validations
        module Matchers
          def validate_presence_of(field)
            HaveValidationMatcher.new(field, :presence)
          end
        end
      end
    end
  end
end
