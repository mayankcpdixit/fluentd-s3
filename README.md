# fluentd-s3
Is a [Helm Chart](https://helm.sh/docs/topics/charts/) to start [Daemonsets](https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/) on each [K8S node](https://kubernetes.io/docs/concepts/architecture/nodes/) for tailing logs using [fluentd tail_in](https://docs.fluentd.org/input/tail) and publish on to s3 bucket using [fluentd-plugin-s3](https://github.com/fluent/fluent-plugin-s3).

## How will it run
A Daeamonset will start with pods launching fluentd with config as mentione din `values.yaml`.The pod is supposed to have [kube2iam](https://github.com/jtblin/kube2iam) annotation for providing the pod enough permission to write to s3 bucket.

## Checklist
1. [Create an IAM role](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/iam-roles-for-amazon-ec2.html#create-iam-role) & an S3 bucket, keep the role arn handy to prode in `helm install` command
2. Install [kube2iam](https://github.com/jtblin/kube2iam) on all nodes
3. Update region and bucket info in the `values.yaml` 
4. Run below commands to install/upgrade/uninstall 

## Handy Commands 
```
helm install fluentd-s3/ --name fluentd-s3 --namespace log --set awsRole=arn:aws:iam::123456789012:role/FluentdS3Publisher
helm upgrade fluentd-s3 fluentd-s3/ --namespace log --set awsRole=arn:aws:iam::123456789012:role/FluentdS3Publisher
helm delete --purge fluentd-s3
```

