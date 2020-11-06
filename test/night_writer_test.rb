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
    assert_output(/Created 'braille.txt' containing 256 characters/) {puts @night_writer.message}
  end
end
