require 'spec_helper'

module OCR
  module Validation
    describe Base do
      Given(:validator) { Base.new }
      Given(:digits) { ocr_digits(number) }

      context 'with all digits legible' do
        Given(:number) { '000000000' }
        Then { validator.valid?(digits) }
      end

      context 'with an illegible digit' do
        Given(:number) { '0000 0000' }
        Then { not validator.valid?(digits) }
      end
    end
  end
end
