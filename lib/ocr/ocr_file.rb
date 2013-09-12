module OCR
  # Public: Encapsulate a file of OCR data.
  class OCRFile
    # Public: Initialize from IO object.
    def initialize(file)
      @file = file
    end

    # Public: Split OCR file into single numbers/entries.
    #
    # Returns the Enumerator of ScannedNumbers.
    def entries(&block)
      Enumerator.new do |y|
        until @file.eof?
          lines = @file.gets('').split("\n")
          y << ScannedNumber.new(*lines)
        end
      end.each(&block)
    end
  end
end
