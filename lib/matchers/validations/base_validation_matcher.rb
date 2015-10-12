module Easy
  module Matchers
    class BaseValidationMatcher
      attr_reader :attributes,
                  :failure_message,
                  :failure_message_when_negated,
                  :subject,
                  :type,
                  :options

      def initialize(attributes, type)
        @attributes = attributes
        @failure_message = nil
        @failure_message_when_negated = nil
        @type = type
        @options = {}
      end

      def matches?(subject)
        @subject = subject
        false
      end

      def class_name
        subject.class
      end

      def description
        raise NotImplementedError, 'Subclasses must implement a description method.'
      end
    end
  end
end
