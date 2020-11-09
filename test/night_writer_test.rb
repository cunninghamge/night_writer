# require_relative './test_helper'
# require './lib/night_writer'
#
# class NightWriterTest < Minitest::Test
#   def setup
#     ARGV.replace(['./data/short.txt', 'braille.txt'])
#     @night_writer = NightWriter.new
#   end
#
#   def test_it_exists
#     assert_instance_of NightWriter, @night_writer
#   end
#
#   def test_it_makes_a_file_io
#     assert_instance_of FileIO, @night_writer.file
#   end
#
#   def test_it_makes_a_parser
#     assert_instance_of LineParser, @night_writer.parser
#   end
#
#   def test_output
#     message = ("Created 'braille.txt' containing 10 characters\n")
#     assert_output(message) {puts @night_writer.message}
#   end
# end
