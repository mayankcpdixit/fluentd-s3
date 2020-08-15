FROM fluent/fluentd-kubernetes-daemonset:v1.11.1-debian-cloudwatch-1.1
RUN gem install fluent-plugin-s3:1.4.0

