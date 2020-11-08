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

  def test_it_can_have_a_different_output
    ARGV[1] = 'night_writer.txt'
    message = "Created 'night_writer.txt' containing 10 characters\n"
    assert_output(message) {puts ARGV.inspect}
  end

  def test_number_of_characters
    message = "Created 'braille.txt' containing 10 characters\n"
    assert_output(message) {puts ARGV.inspect}

    ARGV[0] = './data/sentence.txt'
    message = "Created 'braille.txt' containing 63 characters\n"
    assert_output(message) {puts ARGV.inspect}
  end

  def test_it_makes_a_file
    ARGV[1] = 'night_writer.txt'
    NightWriter.new

    assert_equal true, File.exist?('./night_writer.txt')
    expected = ".0..0.00..0.0.0.0.\n0.........00.000.0\n......0.......0...\n"
    assert_equal expected, File.read('./night_writer.txt')

    File.delete('./night_writer.txt')
  end

  def test_read_printed
    assert_equal ["i am here\n"], @night_writer.read_printed
  end

  def teardown
    File.delete('./braille.txt')
  end
end
