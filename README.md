# numbarb_frontend

Simple static website hosted on S3, deployed with Terraform

See here: http://sergdragan2-numbarb.s3-website.eu-central-1.amazonaws.com/

To deploy:
```
terraform init
terraform apply
aws s3 sync site s3://sergdragan2-numbarb/
```
