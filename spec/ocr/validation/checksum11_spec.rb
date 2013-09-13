require 'spec_helper'

def make_digits(number)
  number.chars.collect do |n|
    d = OCR::ScannedDigit.new('', '', '')
    d.stub(:value) { n }
    d
  end
end

module OCR
  module Validation
    describe Checksum11 do
      Given(:validator) { Checksum11.new }

      describe '#checksum' do
        context 'zeros have no effect' do
          Given(:digits) { make_digits('000000000') }
          Then { validator.checksum(digits) == 0 }
        end

        context 'digit is multiplied by distance from end, then mods by 11' do
          (1..9).each do |i|
            context "with digit #{i} from end" do
              Given(:digits) { make_digits('00000000'.insert(-i, '7')) }
              Then { validator.checksum(digits) == 7*i % 11 }
            end
          end
        end

        context 'after multiplying, values are summed' do
          (2..9).each do |i|
            context "digits 1 and #{i} from the end" do
              Given(:digits) { make_digits('00000001'.insert(-i, '1')) }
              Then { validator.checksum(digits) == i+1 }
            end
          end
        end

        context 'after summation, value is modded by 11' do
          Given(:digits) { make_digits('100000002') }
          Then { validator.checksum(digits) == 0 }
        end
      end

      describe '#valid?' do
        context 'with checksum == 0' do
          Given(:digits) { make_digits('100000002') }
          Then { validator.valid?(digits) }
        end

        (1..10).each do |n|
          context "with checksum == #{n}" do
            Given(:digits) { make_digits('010001000' + n.to_s) }
            Then { not validator.valid?(digits) }
          end
        end
      end
    end
  end
end
