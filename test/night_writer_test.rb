require_relative './test_helper'
require './lib/night_writer'

class NightWriterTest < Minitest::Test
  def setup
    ARGV.replace(['./data/one_char.txt', 'braille.txt'])
    @night_writer = NightWriter.new
  end

  def test_it_exists
    assert_instance_of NightWriter, @night_writer
  end

  def test_it_makes_a_parser
    assert_instance_of LineParser, @night_writer.parser
  end

  def test_output
    message = ("Created 'braille.txt' containing 2 characters\n")
    assert_output(message) {puts ARGV.inspect}
  end

  def test_it_can_have_a_different_output
    ARGV[1] = 'night_writer.txt'
    message = ("Created 'night_writer.txt' containing 2 characters\n")
    assert_output(message) {puts ARGV.inspect}
  end

  def test_number_of_characters
    message = ("Created 'braille.txt' containing 2 characters\n")
    assert_output(message) {puts ARGV.inspect}

    ARGV[0] = './data/sentence.txt'
    NightWriter.new
    message = ("Created 'braille.txt' containing 63 characters\n")
    assert_output(message) {puts ARGV.inspect}
  end

  def test_it_makes_a_file
    ARGV[1] = 'night_writer.txt'
    @night_writer.write_to_file

    assert_equal true, File.exist?('./night_writer.txt')
    assert_equal "a\n", File.read('./night_writer.txt')

    File.delete('./night_writer.txt')
  end

  def test_read_printed
    assert_equal ["a\n"], @night_writer.read_printed
  end

  def test_translate_to_braille
    assert_equal "a\n", @night_writer.translate_to_braille
  end
end
