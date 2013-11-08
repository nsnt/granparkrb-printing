
video_box = []
while line=STDIN.gets do 
  video_box.push line = line.scan(/\"[A-Z, ]\"/).map!{|s| s.gsub("\"","")}
end

#target="STAY HUNGRY, STAY FOOOOOOOOOLISH"
#target="IF YOU CHASE TWO RABBITS, YOU WILL LOSE THEM BOTH"
#target="IT IS ENTIRELY SEEMLY FOR A YOUNG MAN KILLED IN BATTLE TO LIE MANGLED BY THE BRONZE SPEAR"
#target="IF MUSIC BE THE FOOD OF LOVE, PLAY ON"
target="PEOPLE CAN HAVE THE MODEL T IN ANY COLOR, SO LONG AS IT IS BLACK"

target.split("").each{|c|
  found = false
  video_box.each_with_index{|line,i|
    line.each_with_index{|stamp,j|
      if stamp == c && !found then
        if c==" " then c="space" end
        puts "#{i+1},#{j+1} = #{c}"
        video_box[i][j] = nil
        found = true
      end
      if found then break end
    }
    if found then break end
  }
  if !found then 
    puts "cannot print!"
    exit
  end
}
