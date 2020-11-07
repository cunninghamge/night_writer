require "minitest/autorun"
require "minitest/pride"
require 'mocha/minitest'
require './lib/night_writer'

class NightWriterTest < Minitest::Test
  def setup
    @night_writer = NightWriter.new
    ARGV[1] = 'braille.txt'
  end

  def test_it_exists
    assert_instance_of NightWriter, @night_writer
  end

  def test_output
    message = ("Created 'braille.txt' containing 256 characters\n")
    assert_output(message) {puts @night_writer.inspect}
  end

  def test_it_can_have_a_different_output
    ARGV[1] = 'night_writer.txt'
    message = ("Created 'night_writer.txt' containing 256 characters\n")
    assert_output(message) {puts @night_writer.inspect}
  end
end
