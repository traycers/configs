target = Dir.home

root   = File.dirname File.expand_path __FILE__
#target = "#{root}/test/"
source = "#{root}/src/"

res = Dir.entries(source) - ['.','..']
res.each { |item|
  dest = File.expand_path item, target
  src  = File.expand_path item, source

  if File.symlink? dest  or File.exists? dest 
    puts "remove #{dest}"
    begin
      File.delete dest
    rescue
      puts "action is fail: #{$!.inspect}"
      next
    end
  end

  puts "cleate symlink #{src} => #{dest}"
  begin
    File.symlink src, dest
  rescue
    puts "action is fail: #{$!.inspect}"
  end
}
