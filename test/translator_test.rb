require "minitest/autorun"
require "minitest/pride"
require './lib/translator'

class TranslatorTest < Minitest::Test
  def setup
    plain = File.read('./data/sentence.rb')
    @translator = Translator.new(plain)
  end

  def test_it_exists

  end
end
