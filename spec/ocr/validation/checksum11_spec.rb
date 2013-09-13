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
    end
  end
end
