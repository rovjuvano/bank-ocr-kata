require 'spec_helper'
require 'open3'

SCRIPT_NAME = File.dirname(__FILE__) + '/../bin/ocr'

def run_script(contents)
  Open3.capture2e(SCRIPT_NAME, :stdin_data => contents)[0]
end

describe 'shell script' do
  context 'with all valid numbers' do
    Given(:contents) { ocr_contents(:zeros, :one_to_nine) }
    When(:output) { run_script(contents) }
    Then { output == "000000000\n123456789\n" }
  end
end
