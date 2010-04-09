require 'pp'
require 'positional'
require 'in_or_out'

 obj = InOrOut.new
 obj.temp = 32.0
  # ...  more attribute settings

 # parsing
 arry=Array.new 20
 pb = Positional::MaskedParse.new arry.extend Positional::Decorator::Index
 pq = Positional::Parse.new obj.extend Positional::Decorator::Message

 arry = pb.parse 'GCTACTGCAAGTTCTAGACT'
 obj = pq.parse '32.0 189 10000 450 "Ok"', [:temp, :pressure, :flow_rate, :rpm, :message]

 p arry
 pp obj

 # formatting
 pf = Positional::MaskedFormat.new arry
 qf = Positional::Format.new obj

 puts pf.to_s
 puts qf.to_s [:temp, :pressure, :flow_rate, :rpm, :message]
