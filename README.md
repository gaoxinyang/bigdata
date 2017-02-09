# Some big data tools on OpenShift

**Extremely non-production, playground!**

## Zookeeper

Deploy Zookeeper instance on OpenShift

```
oc new-app mjelen/zookeeper
```

## Kafka

Deploy Kafka using the Zookeeper instance on OpenShift

```
oc new-app mjelen/kafka
```

by scaling replicas up/down it should be possible to scale the cluster,
when doing so, Kafka seems to detect other instances work in the cluster,
though I did not test anything in distributed way.

## Flink

Deploy Flink on OpenShift

Create JobManager service

```
oc create -f flink/jobs-svc.yml
```

Deploy JobManager

```
oc create -f flink/jobs-rc.yml
```

Deploy TaskManager

```
oc create -f flink/tasks-rc.yml
```

JobManager is not distributed, yet, but by scaling replicas of TaskManager
up/down it is possible to add/remove worker nodes.

To access the web management console, expose the 8081 port on the JobsManager
service.
