# CommuniGate

> This chart is still in early development and is by no means complete.  Please keep this in mind and report any issues or missing features on our [GitHub](https://github.com/FunkyNERD/helm-charts).

[CommuniGate](http://communigate.world/) is a Unified Communications platform.

## TL;DR;

```bash
$ helm repo add funkynerd https://funkynerd.github.io/helm-charts
$ helm install communigate funkynerd/communigate
```

## Introduction

This chart creates a [CommuniGate](http://communigate.world/) statefulset on a [Kubernetes](http://kubernetes.io)
cluster using the [Helm](https://helm.sh) package manager.

## Installing the Chart

To install the chart with the release name `communigate`:

```bash
$ helm install communigate funkynerd/communigate
```

The command deploys CommuniGate on the Kubernetes cluster in the default configuration. The [configuration](#configuration)
section lists the parameters that can be configured during installation.

## Uninstalling the Chart

To uninstall/delete the `communigate` deployment:

```bash
$ helm uninstall communigate
```
The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the CommuniGate chart and their default values.

Parameter | Description | Default
--- | --- | ---
`image.repository` | Docker image repository | `jamiecarl/communigate`
`image.tag` | Docker image tag whose default is the chart version | `""`
`image.pullPolicy` | Docker image pull policy | `IfNotPresent`
`communigate.replicaCount` | Specifies the number of replica pods to deploy | `true` |
`persistence.enabled` | Specifies whether to use a PVC to persist data | `true` |
`persistence.storageClass` | Storage class of backing PVC | `""` (uses alpha storage class annotation) |
`persistence.accessMode` | Use volume as ReadOnly or ReadWrite | `ReadWriteOnce` |
`persistence.size` | Size of data volume | `8Gi` |
`ingress.enabled` | Enables Ingress | `false` |
`ingress.hosts` | Ingress accepted hostnames | `[]` |
`ingress.annotations` | Ingress annotations | `[]` |