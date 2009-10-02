require 'json'
require 'fastercsv'

files = Dir["json/*.json"]

FasterCSV.open("toc.csv", "w") do |csv|
  csv << ["isbn", "section", "title", "page"]
  files.map do |file| 
    book = JSON.parse(File.open(file).read)
    next unless book.has_key? "toc-table" and  book.has_key? "isbn"
  
    book["toc-table"].map do |section|
      csv << [book["isbn"], section["section"], 
        section["title"], section["page"]]
    end
  end
end