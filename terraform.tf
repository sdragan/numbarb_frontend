provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.aws_region
}

resource "aws_s3_bucket" "static_website_bucket" {
  bucket = "${var.namespace}-numbarb"
  acl    = "public-read"

  tags = {
    Name = "Numbarb Static Website"
  }

  policy = <<EOF
{
  "Version":"2012-10-17",
  "Statement":[{
	"Sid":"PublicReadGetObject",
        "Effect":"Allow",
	  "Principal": "*",
      "Action":["s3:GetObject"],
      "Resource":["arn:aws:s3:::${var.namespace}-numbarb/*"
      ]
    }
  ]
}
EOF


  website {
    index_document = "index.html"
    error_document = "404.html"
  }
}
