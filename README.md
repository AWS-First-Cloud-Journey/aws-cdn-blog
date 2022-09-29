**Blog:** https://aws.amazon.com/jp/blogs/networking-and-content-delivery/resizing-images-with-amazon-cloudfront-lambdaedge-aws-cdn-blog/

**Deploy**

1. Upload source to S3

```
aws s3 cp --recursive dist/ s3://<code-bucket>/
```

2. Deploy CloudFormation stack:

```
aws cloudformation deploy \
--capabilities CAPABILITY_IAM \
--template-file resizing-images-with-amazon-cloudfront-lambdaedge-aws-cdn.yaml \
--stack-name resizing-images-cf \
--parameter-overrides LambdaSourceBucketName=<code-bucket>
```

3. Delete CloudFormation stack

```
aws cloudformation delete-stack --stack-name resizing-images-cf
```

4. Delete S3 bucket: 

aws s3 rb s3://<code-bucket>/ --force

**Test solution**

```
https://{cloudfront-domain}/images/image.jpg?d=100x100
```
