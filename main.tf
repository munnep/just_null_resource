resource "null_resource" "test" {}
resource "null_resource" "test2" {}

resource "null_resource" "test3" {}

resource "null_resource" "test4" {}

resource "null_resource" "test5" {}

resource "null_resource" "test6" {}
resource "null_resource" "test7" {}

check "health_check" {
  data "http" "terraform_io" {
    url = "https://www.terraform.io"
  }

  assert {
    condition = data.http.terraform_io.status_code == 200
    error_message = "${data.http.terraform_io.url} returned an unhealthy status code"
  }
}

check "health_check2" {
  data "http" "terraform_iopatrick" {
    url = "https://www.terraformpatrick.io"
  }

  assert {
    condition = data.http.terraform_iopatrick.status_code == 200
    error_message = "${data.http.terraform_iopatrick.url} returned an unhealthy status code"
  }
}

