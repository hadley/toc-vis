isbn <- scan("isbns.txt", "")
url <- paste("http://search.barnesandnoble.com///e/", isbn, sep = "")

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