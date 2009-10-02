# Search barnesandnoble.com.  Filter by:
# 
#   * books
#   * over $50
#   * first 500

curl "http://books.barnesandnoble.com/search/results.aspx?SRT=R&WRD=statistics&AREF=1537&DREF=1&SZE=500"  -o statistics.html
curl "http://books.barnesandnoble.com/search/results.aspx?SRT=R&WRD=statistics&AREF=1537&DREF=1&SZE=500&SAT=501"  -o statistics-2.html

curl "http://books.barnesandnoble.com/search/results.aspx?SRT=R&WRD=probability&AREF=1537&DREF=1&SZE=500"  -o probability.html
curl "http://books.barnesandnoble.com/search/results.aspx?SRT=R&WRD=probability&AREF=1537&DREF=1&SZE=500&SAT=501"  -o probability-2.html

parsley extract-url.json statistics.html > statistics.json
parsley extract-url.json statistics-2.html > statistics-2.json
parsley extract-url.json probability.html > probability.json
parsley extract-url.json probability-2.html > probability-2.json
