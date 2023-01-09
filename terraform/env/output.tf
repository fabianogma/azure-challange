data "http" "ip_address" {
  url = "https://api.ipify.org"
  request_headers = {
    "Accept" = "text/plan"
  }
}