require "minitest/autorun"
require "minitest/pride"
require 'mocha/minitest'
require './lib/night_writer'

class NightWriterTest < Minitest::Test
  def setup
    ARGV.replace ['./data/one_char.txt', 'braille.txt']
    @night_writer = NightWriter.new
  end

  def test_it_exists
    assert_instance_of NightWriter, @night_writer
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
    night_writer = NightWriter.new
    message = ("Created 'braille.txt' containing 45 characters\n")
    assert_output(message) {puts ARGV.inspect}
  end

  def test_write_to_file
    @night_writer.write_to_file

    assert_equal true, File.exist?('./braille.txt')
    assert_equal "a\n", File.read('./braille.txt')

    File.delete('./braille.txt')
  end
end
