require 'spec_helper'

class FakeDigit
  attr_reader :value
  def initialize(value)
    @value = value
  end
end

def make_digits(number)
  number.chars.collect {|n| FakeDigit.new(n)}
end

module OCR
  module Validation
    describe Checksum11 do
      Given(:validator) { Checksum11.new }

      context 'zeros have no effect' do
        Given(:digits) { make_digits('000000000') }
        Then { validator.checksum(digits) == 0 }
      end

      context 'digit is multiplied by distance from end' do
        (1..9).each do |i|
          context "with digit #{i} from end" do
            Given(:digits) { make_digits('00000000'.insert(-i, '7')) }
            Then { validator.checksum(digits) == 7*i }
          end
        end
      end
    end
  end
end
