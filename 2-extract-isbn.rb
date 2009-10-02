require 'json'

json_files = Dir["*.json"] - Dir["extract-*.json"]
files = json_files.map{|file| JSON.parse(File.open(file).read)}.flatten


# Basic url: http://search.barnesandnoble.com/title/author/e/isbn
# But title and author can be omitted and url still works
isbns = files.map do |file| 
  file["books"].map do |book|
    book["url"].match("/e/(.*?)/")[1]
  end
end.flatten.uniq.sort

File.open("isbns.txt", "w+") do |file|
  isbns.each{|isbn| file.write isbn + "\n"}
end
