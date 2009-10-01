# Search barnesandnoble.com.  Filter by:
# 
#   * books
#   * over $50
#   * first 500

curl "http://books.barnesandnoble.com/search/results.aspx?SRT=R&WRD=statistics&AREF=1537&DREF=1&SZE=500"  -o statistics.html

curl "http://books.barnesandnoble.com/search/results.aspx?SRT=R&WRD=probability&AREF=1537&DREF=1&SZE=500"  -o probability.html

parsley barnes-and-nobles.json statistics.html > statistics.json
parsley barnes-and-nobles.json probability.html > probability.json
