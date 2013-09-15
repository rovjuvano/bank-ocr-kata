require 'spec_helper'
require 'open3'

SCRIPT_NAME = File.dirname(__FILE__) + '/../bin/ocr'

def run_script(contents)
  Open3.capture2e({'RUBYLIB' => 'lib'}, SCRIPT_NAME, :stdin_data => contents)[0]
end

describe 'shell script' do
  context 'with all valid numbers' do
    Given(:contents) { ocr_contents(:zeros, :one_to_nine) }
    When(:output) { run_script(contents) }
    Then { output == "000000000\n123456789\n" }
  end

  context 'with an invalid number' do
    Given(:contents) { ocr_contents(:one_to_nine, :twos) }
    When(:output) { run_script(contents) }
    Then { output == "123456789\n222222222 ERR\n" }
  end

  context 'with an illegible number' do
    Given(:contents) { ocr_contents(:one_to_nine, :illegible_checksum) }
    When(:output) { run_script(contents) }
    Then { output == "123456789\n1???????2 ILL\n" }
  end

  context 'with an ambiguous number' do
    Given(:contents) { ocr_contents(:one_to_nine, :eights) }
    When(:output) { run_script(contents) }
    Then { output == "123456789\n888888888 AMB\n" }
  end

  context 'with a correctable number' do
    Given(:contents) { ocr_contents(:ones, :zeros_almost) }
    When(:output) { run_script(contents) }
    Then { output == "711111111\n000000000\n" }
  end
end
