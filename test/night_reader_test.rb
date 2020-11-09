# require_relative './test_helper'
# require './lib/night_reader'
#
# class NightReaderTest < Minitest::Test
#   def setup
#     ARGV.replace(['./data/short_braille.txt', 'message.txt'])
#     @night_reader = NightReader.new
#   end
#
#   def test_it_exists
#     assert_instance_of NightReader, @night_reader
#   end
#
#   def test_it_makes_a_file_io
#     assert_instance_of FileIO, @night_reader.file
#   end
#
#   def test_it_makes_a_parser
#     assert_instance_of BrailleParser, @night_reader.parser
#   end
#
#   def test_output
#     message = ("Created 'message.txt' containing 10 characters\n")
#     assert_output(message) {puts @night_reader.message}
#   end
# end
