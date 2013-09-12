module OCR
  class OCRFile
    def initialize(file)
      @file = file
    end

    # Public: Split OCR file into single numbers/entries
    #
    # Returns the Enumerator of ScannedNumbers
    def entries()
      Enumerator.new do |y|
        until @file.eof?
          lines = @file.gets('').split("\n")
          y << ScannedNumber.new(*lines)
        end
      end
    end
  end
end
