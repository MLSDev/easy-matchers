module Easy
  module Matchers
    module Validations
      # The `validate_presence_of` matcher tests usage of the
      # `validates_presence_of` validation. It also support
      # multiple params validations.
      #
      #     class Post
      #       include ActiveModel::Validations
      #
      #       attr_accessor :title
      #
      #       attr_accessor :description
      #
      #       validates_presence_of :title
      #
      #       validates_presence_of :title, :description
      #     end
      #
      #     describe Post do
      #       it { should validate_presence_of(:title) }
      #
      #       it { should validate_presence_of(:title, :description) }
      #     end
      #
      # #### Qualifiers
      #
      # ##### on
      #
      # Use `on` if your validation applies only under a certain context.
      #
      #     class Post
      #       include ActiveModel::Validations
      #
      #       attr_accessor :title
      #
      #       validates_presence_of :title, on: :save
      #     end
      #
      #     describe Post do
      #       it { should validate_presence_of(:title).on(:save) }
      #     end
      #
      # ##### with_message
      #
      # Use `with_message` if you are using a custom validation message.
      #
      #     class Post
      #       include ActiveModel::Validations
      #
      #       attr_accessor :title
      #
      #       validates_presence_of :title, message: 'Title should be filled'
      #     end
      #
      #     describe Post do
      #       it do
      #         should validate_presence_of(:title).
      #           with_message('Title should be filled')
      #       end
      #     end
      #
      # @return [ValidatePresenceOfMatcher]
      #
      def validate_presence_of(*attributes)
        ValidatePresenceOfMatcher.new(attributes)
      end

      class ValidatePresenceOfMatcher < BaseValidationMatcher
        def initialize(attributes)
          super(attributes, :presence)
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
          "require #{ attributes.join(', ') } to be set"
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
          raise NotImplementedError
        end

        def strict
          raise NotImplementedError
        end
      end
    end
  end
end
