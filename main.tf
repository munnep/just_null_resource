# This resource will destroy (potentially immediately) after null_resource.next
resource "null_resource" "previous" {}


resource "null_resource" "previous2" {}
