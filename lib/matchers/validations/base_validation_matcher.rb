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

      def if
        raise NotImplementedError, 'Subclasses must implement a if method.'
      end

      def unless
        raise NotImplementedError, 'Subclasses must implement a unless method.'
      end

      def on(context)
        raise NotImplementedError, 'Subclasses must implement a on method.'
      end

      def allow_nil
        raise NotImplementedError, 'Subclasses must implement a allow_nil method.'
      end

      def allow_blank
        raise NotImplementedError, 'Subclasses must implement a allow_blank method.'
      end

      def strict
        raise NotImplementedError, 'Subclasses must implement a strict method.'
      end
    end
  end
end
