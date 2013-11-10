require "csv"
require "optparse"

opt = OptionParser.new
text = ""
input_file = ""
opt.on('-t VALUE') {|v| text = v }
opt.on('-i VALUE') {|v| input_file = v }
opt.parse(ARGV)

input = CSV.read(input_file)

dict = {}
input.each.with_index(1) do |row, ii|
  row.each.with_index(1) do |col, jj|
    dict[col] ||= []
    dict[col] << [ii, jj]
  end
end
text_dict = {}
text.each_char do |ch|
  text_dict[ch] ||= 0
  text_dict[ch] += 1
end

text_dict.each do |ch, num|
  if dict[ch].size < num
    puts "cannot print"
    exit -1
  end
end

text.each_char do |ch|
  pos = dict[ch].pop.to_s
  puts "#{pos} = #{ch}"
end
