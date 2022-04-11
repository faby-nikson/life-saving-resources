# AWS 

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [S3](#s3)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## S3

List repositories

```
// Current folder
aws s3 ls s3://repository/path
// With all subdirectories
aws s3 ls s3://repository/path --recursive
```

PutObject to S3

```
aws s3 cp my-file.file s3://my-destination/
```
