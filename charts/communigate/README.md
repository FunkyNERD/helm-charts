# CommuniGate

> [!WARNING]  
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
`extraContainers` | Additional containers to be added to the application pod | `[]`
`image.repository` | Docker image repository | `mailhog/mailhog`
`image.tag` | Docker image tag whose default is the chart version | `""`
`image.pullPolicy` | Docker image pull policy | `IfNotPresent`
`communigate.replicaCount` | Specifies the number of replica pods to deploy | `true` |
`serviceAccount.create` | Specifies whether a ServiceAccount should be created | `true` |
`serviceAccount.name` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template | `""` |
`serviceAccount.imagePullSecrets` | Image pull secrets that are attached to the ServiceAccount | `[]` |
`automountServiceAccountToken` | Indicates whether the service account token should be automatically mounted | `false` |
`service.annotations` | Annotations for the service | `{}`
`service.clusterIP` | Internal cluster service IP | `""`
`service.externalIPs` | Service external IP addresses | `[]`
`service.extraPorts` | Additional ports to the service | `[]`
`service.loadBalancerIP` | IP address to assign to load balancer (if supported) | `""`
`service.loadBalancerSourceRanges` | List of IP CIDRs allowed access to load balancer (if supported) | `[]`
`service.type` | Type of service to create | `ClusterIP`
`service.namedTargetPort` | Use named target port for service | `true`
`service.port.http` | HTTP port of service | `""`
`service.port.smtp` | SMTP port of service | `""`
`service.nodePort.http` | If `service.type` is `NodePort` and this is non-empty, sets the http node port of the service | `""`
`service.nodePort.smtp` | If `service.type` is `NodePort` and this is non-empty, sets the smtp node port of the service | `""`
`securityContext` | Pod security context | `{ runAsUser: 1000, fsGroup: 1000, runAsNonRoot: true }`
`ingress.enabled` | If `true`, an ingress is created | `false`
`ingress.ingressClassName` | If set the created Ingress resource will have this class name. kubernetes.io/ingress.class is [deprecated](https://kubernetes.io/docs/concepts/services-networking/ingress/#deprecated-annotation) | `nil`
`ingress.annotations` | Annotations for the ingress | `{}`
`ingress.labels` | Labels for the ingress | `{}`
`ingress.hosts` | A list of ingress hosts | `{ host: mailhog.example.com, paths: [{ path: "/", pathType: Prefix }] }`
`ingress.tls` | A list of [IngressTLS](https://v1-8.docs.kubernetes.io/docs/api-reference/v1.8/#ingresstls-v1beta1-extensions) items | `[]`
