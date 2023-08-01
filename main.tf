resource "null_resource" "test" {}
resource "null_resource" "test2" {}

resource "null_resource" "test3" {}

resource "null_resource" "test4" {}

resource "null_resource" "test5" {}

resource "null_resource" "test6" {}
resource "null_resource" "test7" {}

variable "website" {}

check "health_check" {
  data "http" "terraform_io" {
    url = var.website
  }

  assert {
    condition = data.http.terraform_io.status_code == 200
    error_message = "${data.http.terraform_io.url} returned an unhealthy status code"
  }
}


