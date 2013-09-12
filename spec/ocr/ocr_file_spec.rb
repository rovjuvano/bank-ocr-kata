require 'spec_helper'

module OCR
  describe OCRFile do
    context('with a single entry') do
      Given(:file) { ocr_file(:zeros) }
      When(:values) { OCRFile.new(file).entries.collect { |n| n.value } }
      Then { values == ['000000000'] }
    end

    context('with multiple entries') do
      Given(:file) { ocr_file(:zeros, :one_to_nine) }
      When(:values) { OCRFile.new(file).entries.collect { |n| n.value } }
      Then { values == ['000000000', '123456789'] }
    end
  end
end
