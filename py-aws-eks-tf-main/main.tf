provider "aws" {
  region = "your_aws_region"
}

# Creating an S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "your_bucket_name"
  acl    = "private"

  tags = {
    Name = "MyBucket"
  }
}

# Creating an SQS queue
resource "aws_sqs_queue" "my_queue" {
  name                      = "your_queue_name"
  delay_seconds             = 90
  max_message_size          = 2048
  message_retention_seconds = 86400
  visibility_timeout_seconds = 43200
}

# Creating an EKS cluster
resource "aws_eks_cluster" "my_cluster" {
  name     = "your_cluster_name"
  role_arn = aws_iam_role.my_role.arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }
}

# Creating an IAM role for the EKS cluster
resource "aws_iam_role" "my_role" {
  name = "your_role_name"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect    = "Allow",
      Principal = {
        Service = "eks.amazonaws.com"
      },
      Action    = "sts:AssumeRole"
    }]
  })
}

# Attaching policies to the IAM role
resource "aws_iam_role_policy_attachment" "my_policy_attachment" {
  role       = aws_iam_role.my_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}
