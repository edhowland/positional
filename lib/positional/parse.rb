require "syntax"

module Positional
  class Parse
    attr :format, :object
    def initialize object
      @object = object
    end
    def convert string
      case string
      when /^\d+$/
        string.to_i
      when /^\d*\.\d+$/
        string.to_f
      when /^"([^"]*)"$/
        $1
      else
        string
      end
    end
    def whitespace? string
      if string =~ /^\s+$+/ or string =~ /^$/; true; else; false; end
    end
    def quote? string
      if string =~ /"|'/; true; else; false; end
    end
    def significant? string
      unless quote?(string) or whitespace?(string)
        true
      else
        false
      end
    end
    def parse input
      arry = []
      tokener = Syntax.load 'ruby'
      tokener.tokenize(input) do |token|
        arry << convert(token.to_s) if significant?(token.to_s)
      end
      object.inject do
        arry.shift
      end

      @object
    end
  end
end