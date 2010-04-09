require "pp"
require "positional"

class UnityArray < Array
  alias :old_ndx :[]
  def [](index)
    raise StandardError.new("Range error (#{index < 1 ? '<' : '>'})") if index < 1 or index > length
    old_ndx(index-1)
  end
end


bases='GCTACTGCAAGTTCTAGACT'
qualities='1 8 15 22 60 55 57 56 58 55 60 58 57 59 55 50 44 18 5 6'

bs=UnityArray.new 20
sq=UnityArray.new 20

pb = Positional::MaskedParser.new bs
pq = Positional::Parser.new sq

bs = pb.parse bases
sq = pq.parse qualities

pp bs
 


