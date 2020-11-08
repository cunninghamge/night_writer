require_relative './test_helper'
require './lib/night_writer'

class NightWriterTest < Minitest::Test
  def setup
    ARGV.replace(['./data/short.txt', 'braille.txt'])
    @night_writer = NightWriter.new
  end

  def test_it_exists
    assert_instance_of NightWriter, @night_writer
  end

  def test_it_makes_a_parser
    assert_instance_of LineParser, @night_writer.parser
  end

  def test_output
    message = ("Created 'braille.txt' containing 10 characters\n")
    assert_output(message) {puts ARGV.inspect}
  end

  def test_number_of_characters
    message = "Created 'braille.txt' containing 10 characters\n"
    assert_output(message) {puts ARGV.inspect}
  end

  def test_it_makes_a_file
    assert_equal true, File.exist?('./braille.txt')
    expected = ".0..0.00..0.0.0.0.\n0.........00.000.0\n......0.......0...\n"
    assert_equal expected, File.read('./braille.txt')
  end

  def test_read_printed
    assert_equal ["i am here\n"], @night_writer.read_printed
  end

  def teardown
    File.delete('./braille.txt')
  end
end
