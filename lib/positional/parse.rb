require "syntax"

module Positional
  class Parse < ParserBase
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
    def parse input, fmt=nil
      arry = []
      tokener = Syntax.load 'ruby'
      tokener.tokenize(input) do |token|
        arry << convert(token.to_s) if significant?(token.to_s)
      end
      super(fmt) do
        arry.shift
      end
    end
  end
end