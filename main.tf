# This resource will destroy (potentially immediately) after null_resource.next
resource "null_resource" "previous" {}

resource "time_sleep" "wait_30_seconds" {
  depends_on = [null_resource.previous]

  create_duration = "30s"
}

# This resource will create (at least) 30 seconds after null_resource.previous
resource "null_resource" "next" {
  depends_on = [time_sleep.wait_30_seconds]
}

resource "time_sleep" "wait_30_seconds2" {
    depends_on = [time_sleep.wait_30_seconds]

  create_duration = "30s"
}

resource "null_resource" "next2" {
  depends_on = [time_sleep.wait_30_seconds2]
}


# variable "website" {}
# comment
# check "health_check" {
#  data "http" "terraform_io" {
#    url = var.website
#  }
# 
#   assert {
#     condition = data.http.terraform_io.status_code == 200
#     error_message = "${data.http.terraform_io.url} returned an unhealthy status code"
#   }
# }


