require 'spec_helper'

describe Easy::Matchers::BaseValidationMatcher do
  let(:attributes) { :attribute }

  let(:type) { :validator }

  subject { described_class.new(attributes, type) }

  describe '#initialize'

  describe '#matches?'

  # module Easy
  #   module Matchers
  #     class BaseValidationMatcher
  #       attr_reader :attributes,
  #                   :failure_message,
  #                   :failure_message_when_negated,
  #                   :subject,
  #                   :type,
  #                   :options
  #
  #       def initialize(attributes, type)
  #         @attributes = attributes
  #         @failure_message = nil
  #         @failure_message_when_negated = nil
  #         @type = type
  #         @options = {}
  #       end
  #
  #       def matches?(subject)
  #         @subject = subject
  #         false
  #       end

  describe '#class_name' do
    before do
      #
      # subject.subject.class
      #
      expect(subject).to receive(:subject) do
        double.tap do |a|
          expect(a).to receive(:class)
        end
      end
    end

    specify { expect { subject.class_name }.not_to raise_error }
  end

  describe '#description' do
    specify { expect { subject.description }
      .to raise_error(NotImplementedError, 'Subclasses must implement a description method.') }
  end


  describe '#if' do
    specify { expect { subject.if }
      .to raise_error(NotImplementedError, 'Subclasses must implement a if method.') }
  end

  describe '#unless' do
    specify { expect { subject.unless }
      .to raise_error(NotImplementedError, 'Subclasses must implement a unless method.') }
  end

  describe '#on' do
    specify { expect { subject.on(:create) }
      .to raise_error(NotImplementedError, 'Subclasses must implement a on method.') }
  end

  describe '#allow_nil' do
    specify { expect { subject.allow_nil }
      .to raise_error(NotImplementedError, 'Subclasses must implement a allow_nil method.') }
  end

  describe '#allow_blank' do
    specify { expect { subject.allow_blank }
      .to raise_error(NotImplementedError, 'Subclasses must implement a allow_blank method.') }
  end

  describe '#strict' do
    specify { expect { subject.strict }
      .to raise_error(NotImplementedError, 'Subclasses must implement a strict method.') }
  end
end
