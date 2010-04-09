require "rubygems"
require "positional"

class UnityArray < Array
  alias :old_ndx :[]
  alias :old_each_with_index :each_with_index 
  def [](index)
    raise StandardError.new("Range error (#{index < 1 ? '<' : '>'})") if index < 1 or index > length
    old_ndx(index-1)
  end
  def each_with_index(&block)
    old_each_with_index {|e,i| yield e,i+1}
  end
end


bases='GCTACTGCAAGTTCTAGACT'
qualities='1 8 15 22 60 55 57 56 58 55 60 58 57 59 55 50 44 18 5 6'

bs=UnityArray.new 20
sq=UnityArray.new 20

pb = Positional::MaskedParse.new bs.extend Positional::Decorator::Index
pq = Positional::Parse.new sq.extend Positional::Decorator::Index


bs = pb.parse bases
sq = pq.parse qualities

class SequenceQuality
  class SQ
    attr :base, :phred
    def initialize(b,p)
      @base=b
      @phred=p
    end
  end
  
  def initialize(bs, sq)
    @bases = bs
    @phreds = sq
  end
  
  def [](index)
    SQ.new @bases[index], @phreds[index]
  end

  def cutoff(q)
    (10**(-q/10)).to_f
  end

  def mask(len)
    str=''
    @bases.each_with_index do |b,i|
      if @phreds[i] >= len
        str << b
      else
        str << 'X'
      end
    end
    str
  end
end

foo = SequenceQuality.new bs, sq

puts foo[4].base
puts foo[4].phred
puts foo.mask(20)
puts 'XXXACTGCAAGTTCTAGXXX'


