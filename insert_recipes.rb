def insert_data(file_path)
  data_str = ""
  File.open(file_path) do |j|
    recipes = JSON.load(j)
    recipes.each do |recipe|
      molded_data = {
        "recipe_id" => recipe["id"],
        "title" => recipe["title"],
        "image_url" => recipe["image"],
        "description" => recipe["description"],
        "tags" => recipe["ingredients"],
      }
      molded_data = molded_data.to_json
      data_str << '{"index": {}}'<< "\n" << molded_data << "\n"
    end
  end
  data_str << "\n"

  File.open("./es_bulk_insert.json","w") do |out|
    out.puts(data_str)
  end
  File.open("hoge.txt","w") do |f|
    f.puts("test")
  end
end

=begin
  {index: {}}\r
  {recipe_id: 0,title: "hogoehoge",imege: "https://path/to/image.img",description: "description.....",tags:["ingredient","ingredient",...],}
  {index: {}}
  {...}
  ....
=end
