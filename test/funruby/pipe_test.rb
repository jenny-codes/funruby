# frozen_string_literal: true

require 'test_helper'
require './lib/funruby/pipe'

module Funruby
  class PipeTest < Minitest::Test
    def test_return_nil_with_zero_args
      assert_nil Pipe[nil].run
    end

    def test_directly_return_with_one_arg
      result = Pipe[3].run

      assert_equal 3, result
    end

    def test_apply_2nd_arg_to_1st_arg
      add3 = ->(x) { x + 3 }

      result = Pipe[3][add3].run

      assert_equal 6, result
    end

    def test_chaining_multiple_methods
      what = 'FunRuby'
      is = ->(str) { "#{str} is" }
      fun = ->(str) { "#{str} fun" }

      result = Pipe[what][is][fun].run

      assert_equal 'FunRuby is fun', result
    end
  end
end
