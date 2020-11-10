ARGV.replace(['./data/short.txt', 'braille.txt'])
require_relative './test_helper'
require './lib/night_writer'

class NightWriterTest < Minitest::Test
  def setup
    @night_writer = NightWriter.new
  end

  def test_it_exists
    assert_instance_of NightWriter, @night_writer
  end

  def test_message
    message = ("Created 'braille.txt' containing 10 characters\n")
    assert_output(message) {puts @night_writer.message}
  end
end
