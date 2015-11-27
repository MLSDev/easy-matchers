require 'spec_helper'

describe Easy::Matchers::BaseValidationMatcher do
  let(:attributes) { :attribute }

  let(:type) { :validator }

  subject { described_class.new(attributes, type) }

  describe '#initialize' do
    specify { expect(subject.attributes).to eq(attributes) }

    specify { expect(subject.failure_message).to eq(nil) }

    specify { expect(subject.failure_message_when_negated).to eq(nil) }

    specify { expect(subject.subject).to eq(nil) }

    specify { expect(subject.type).to eq(type) }

    specify { expect(subject.options).to eq({}) }
  end

  describe '#matches?' do
    let(:new_subject) { double }

    specify { expect { subject.matches?(new_subject) }.to change { subject.subject }.from(nil).to(new_subject) }

    specify { expect(subject.matches?(new_subject)).to eq(false) }
  end

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
    specify { expect { subject.if(:hello) }
      .to raise_error(NotImplementedError, 'Subclasses must implement a if method.') }
  end

  describe '#unless' do
    specify { expect { subject.unless(:hello) }
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
    specify { expect { subject.strict(true) }
      .to raise_error(NotImplementedError, 'Subclasses must implement a strict method.') }
  end
end
