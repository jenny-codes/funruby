# frozen_string_literal: true

module Funruby
  class Pipe
    def self.[](x)
      new([x])
    end

    def initialize(args)
      @args = args
    end

    def [](x)
      self.class.new(@args << x)
    end

    def run
      @args.reduce { |memo, arg| arg.call(memo) }
    end
  end
end
