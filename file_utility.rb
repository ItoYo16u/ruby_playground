# ファイルを開いて処理して自動で閉じる

File.open("path/to/file_name","r:UTF-8") do |file|
	file.each do |line|
		# do something
	end
end

# ファイルの作成と書き込み w: Write

File.open("path/to/new_file_name","w",0644) do |file|
	file.puts("content")
end

# ファイルへの追記 a: Add
File.open("path/to/file_name","a") do |file|
	file.puts("content")
end
# ファイル全体の読み込み file.read
File.open("path/to/file"."r:utf-8") do |file|
	puts file.read
end



