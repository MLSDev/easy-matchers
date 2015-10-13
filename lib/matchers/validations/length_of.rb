module Easy
  module Matchers
    module Validations
      def validate_length_of(*attributes)
        ValidateLengthOfMatcher.new(attributes)
      end

      class ValidateLengthOfMatcher < BaseValidationMatcher
        def initialize(attributes)
          super(attributes, :length)
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
          options[:allow_blank] = true
          self
        end

        def strict
          raise NotImplementedError
        end

        def is_at_most(value)
          options[:maximum] = value
          self
        end

        def is_at_least(value)
          options[:minimum] = value
          self
        end

        # def is_equal_to
        #   @is = value
        #   self
        # end

        def description
          description = "ensure #{ attributes.join(', ') } has a length "
        #   options_desc = []
        #   options_desc << "with minimum of #{ @minimum }" if @minimum
        #   options_desc << "with maximum of #{ @maximum }" if @maximum
        #   # options_desc << "within the range of #{ @within }" if @within
        #   # options_desc << "as exactly #{ @is }" if @is
        #   options_desc << "with message '#{ @expected_message }'" if @expected_message
        #   super << " #{ options_desc.to_sentence }"
          description
        end

        private

        # # def check_exact
        # #   if actual_is == @is
        # #     @positive_result_message << " as exactly #{@is}"
        # #   else
        # #     @negative_result_message << " as exactly #{actual_is}"
        # #     @result = false
        # #   end
        # # end
        #
        # def check_expected_message
        #   actual_message = @validator.options[:message]
        #   if actual_message.nil?
        #     @negative_result_message << ' with no custom message'
        #     @result = false
        #   elsif actual_message == @expected_message
        #     @positive_result_message << " with custom message '#{ @expected_message }'"
        #   else
        #     @negative_result_message << " got message '#{ actual_message }'"
        #     @result = false
        #   end
        # end
      end
    end
  end
end
