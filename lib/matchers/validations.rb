module Easy
  module Matchers
    module Validations
      class HaveValidationMatcher
        def initialize(field, type)
          @field = field
          @type = type
          @options = {}
        end

        def matches?(actual)
          @klass = actual.is_a?(Class) ? actual : actual.class

          @validator = @klass.validators_on(@field).detect{ |v|
            v.kind == @type && (!v.options[:on] || on_options_matches?(v))
          }

          if @validator
            @negative_result_message = "#{ @type.inspect } validator on #{ @field.inspect }"
            @positive_result_message = "#{ @type.inspect } validator on #{ @field.inspect }"
          else
            @negative_result_message = "no #{ @type.inspect } validator on #{ @field.inspect }"
            return false
          end
          @result = true
          check_on if @options[:on]
          @result
        end

        def failure_message
          "Expected #{ @klass.inspect } to #{ description }; instead got #{ @negative_result_message }"
        end

        def failure_message_when_negated
          "Expected #{ @klass.inspect } to not #{ description }; instead got #{ @positive_result_message }"
        end

        def description
          desc = "have #{ @type } validator on #{ @field }"
          desc << " on #{ @options[:on] }" if @options[:on]
          desc
        end

        def on(*on_method)
          @options[:on] = on_method.flatten
          self
        end

        def check_on
          validator_on_methods = [@validator.options[:on]].flatten

          if validator_on_methods.any?
            message = " on methods: #{ validator_on_methods }"

            if on_options_covered_by?(@validator)
              @positive_result_message << message
            else
              @negative_result_message << message
              @result = false
            end
          end
        end

        private

        def on_options_matches?(validator)
          @options[:on] && validator.options[:on] && on_options_covered_by?(validator)
        end

        def on_options_covered_by?(validator)
          ([@options[:on]].flatten - [validator.options[:on]].flatten).empty?
        end
      end
    end
  end
end
