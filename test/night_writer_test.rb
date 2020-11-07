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
    @night_writer.incoming_text.stubs(:size).returns(256)
    message = ("Created 'braille.txt' containing 256 characters\n")
    assert_output(message) {puts @night_writer.inspect}
  end

  def test_it_can_have_a_different_output
    ARGV[1] = 'night_writer.txt'
    @night_writer.incoming_text.stubs(:size).returns(256)
    message = ("Created 'night_writer.txt' containing 256 characters\n")
    assert_output(message) {puts @night_writer.inspect}
  end

  def test_number_of_characters
    message = ("Created 'braille.txt' containing 2 characters\n")
    assert_output(message) {puts @night_writer.inspect}

    ARGV.replace(['./data/sentence.txt', 'braille.txt'])
    night_writer = NightWriter.new
    message = ("Created 'braille.txt' containing 45 characters\n")
    assert_output(message) {puts night_writer.inspect}
  end
end
