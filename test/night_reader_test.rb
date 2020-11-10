ARGV.replace(['./data/short_braille.txt', 'message.txt'])
require_relative './test_helper'
require './lib/night_reader'

class NightReaderTest < Minitest::Test
  def setup
    @night_reader = NightReader.new
  end

  def test_it_exists
    assert_instance_of NightReader, @night_reader
  end

  def test_output
    message = ("Created 'message.txt' containing 10 characters\n")
    assert_output(message) {puts @night_reader.message}
  end
end
