require 'json'

stat = JSON.parse(File.open("statistics.json").read)
prob = JSON.parse(File.open("probability.json").read)

books = stat["books"] + prob["books"]

# Basic url: http://search.barnesandnoble.com/title/author/e/isbn
# But title and author can be omitted and url still works
isbns = books.map do |book| 
  book["url"].match("/e/(.*?)/")[1]
end.uniq

File.open("isbns.txt", "w+") do |file|
  isbns.each{|isbn| file.write isbn + "\n"}
end
