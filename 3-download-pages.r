library(plyr)

isbn <- scan("isbns.txt", "")
url <- paste("http://search.barnesandnoble.com///e/", isbn, sep = "")

# Download html file
for(i in seq_along(isbn)) {
  path <- paste("books/", isbn[i], ".html", sep = "")
  if (file.exists(path)) {
    cat(".")
    next
  }
  
  download.file(url[i], path, quiet = T)
  # Avoids B&N throttling
  Sys.sleep(5)
  cat(".")
}
cat("\n")

# grep -c "name=\"TOC\"" *.html | cut -d: -f2 | sort | uniq -c


# Convert html to json

input <- paste("books/", isbn, ".html", sep = "")
output <- paste("json/", isbn, ".json", sep = "")
cmd <- paste("parsley extract-toc.json", input, "-o", output)

l_ply(cmd, system)