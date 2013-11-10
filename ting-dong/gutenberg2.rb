require "csv"
require "optparse"

opt = OptionParser.new
input_file = ""
opt.on('-i VALUE') {|v| input_file = v }
opt.parse(ARGV)

dict ={}
("A".."Z").each {|ch| dict[ch] = nil }
CSV.read(input_file).each.with_index(1) do |row, ii|
  row.each.with_index(1) do |col, jj|
    dict[col] ||= []
    dict[col] << [ii, jj]
  end
end

def check(text, dict)
  text_dict = {}
  text.each_char do |ch|
    text_dict[ch] ||= 0
    text_dict[ch] += 1
  end

  text_dict.each do |ch, num|
    if dict[ch].size < num
      puts "cannot print"
      return false
    end
  end

  text.each_char do |ch|
    pos = dict[ch].pop.to_s
    puts "#{pos} = #{ch}"
  end
end

while line = STDIN.gets
  # break if /exit/ =~ line
  check(line.chomp!, dict)
  dict.map {|k, _| puts "#{k}:#{dict[k].size}" }
end
