require_relative './test_helper'
require './lib/night_reader'

class NightReaderTest < Minitest::Test
  def setup
    ARGV.replace(['./data/short_braille.txt', 'message.txt'])
    @night_reader = NightReader.new
  end

  def test_it_exists
    assert_instance_of NightReader, @night_reader
  end

  def test_it_makes_a_parser
    assert_instance_of BrailleParser, @night_reader.parser
  end

  def test_output
    message = ("Created 'message.txt' containing 10 characters\n")
    assert_output(message) {puts ARGV.inspect}
  end

  def test_number_of_characters
    message = "Created 'message.txt' containing 10 characters\n"
    assert_output(message) {puts ARGV.inspect}
  end

  def test_it_makes_a_file
    assert_equal true, File.exist?('./message.txt')
    assert_equal "i am here\n", File.read('./message.txt')
  end

  def test_read_braille
    expected = [".0..0.00..0.0.0.0.\n", "0.........00.000.0\n", "......0.......0...\n"]
    assert_equal expected, @night_reader.read_braille
  end

  def teardown
    File.delete('./message.txt')
  end
end
