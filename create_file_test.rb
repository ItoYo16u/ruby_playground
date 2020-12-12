File.open("hoge.txt", "w") do |f|
  f.puts("test 01")
end
File.open("foo.txt", "w") do |f|
  f.puts("test 02")
end
