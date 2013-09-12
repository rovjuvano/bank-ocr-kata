require 'spec_helper'

module OCR
  module Validation
    describe Base do
      Given(:validator) { Base.new }
      Then { validator.valid?(nil) }
    end
  end
end
