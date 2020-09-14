# AWS S3

## List repositories

```
// Current folder
aws s3 ls s3://repository/path
// With all subdirectories
aws s3 ls s3://repository/path --recursive
```

## PutObject to S3

aws s3 cp my-file.file s3://my-destination/
