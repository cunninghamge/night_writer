require "minitest/autorun"
require "minitest/pride"
require 'mocha/minitest'
require './lib/night_writer'

class NightWriterTest < Minitest::Test
  def setup
    @night_writer = NightWriter.new
  end

  def test_it_exists
    assert_instance_of NightWriter, @night_writer
  end

  def test_output
    @night_writer.stubs(:writer).returns('braille.txt')
    message = (/Created 'braille.txt' containing 256 characters/)
    assert_output(message) {puts @night_writer.inspect}
  end

  def test_it_can_have_a_different_output
    @night_writer.stubs(:writer).returns('night.txt')
    message = (/Created 'night.txt' containing 256 characters/)
    assert_output(message) {puts @night_writer.inspect}
  end

end
