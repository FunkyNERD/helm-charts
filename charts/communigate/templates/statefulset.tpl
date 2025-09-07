apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: {{ .Release.Name }}
  labels:
    app: communigate
spec:
  replicas: {{ .Values.communigate.replicaCount }}
  selector:
    matchLabels:
      app.kubernetes.io/component: {{ .Release.Name }}
      app.kubernetes.io/instance: {{ .Release.Name }}
      app.kubernetes.io/managed-by: Helm
      app.kubernetes.io/name: communigate
      app.kubernetes.io/version: {{ .Chart.AppVersion }}
  template:
    metadata:
      labels:
        app.kubernetes.io/component: {{ .Release.Name }}
        app.kubernetes.io/instance: {{ .Release.Name }}
        app.kubernetes.io/managed-by: Helm
        app.kubernetes.io/name: communigate
        app.kubernetes.io/version: {{ .Chart.AppVersion }}
    spec:
      containers:
        - name: communigate
          image: {{ .Values.image.repository }}:{{ .Chart.AppVersion | default .Values.image.tag }}
          {{ if .Values.persistence.enabled }}
          volumeMounts:
          - name: storage
            mountPath: "/var/CommuniGate"
          {{ end }}
          ports:
            - containerPort: 9010
              protocol: TCP
            - containerPort: 80
              protocol: TCP
          imagePullPolicy: {{ .Values.image.pullPolicy }}
      restartPolicy: Always
      dnsPolicy: ClusterFirst
  {{ if .Values.persistence.enabled }}
  volumeClaimTemplates:
    - metadata:
        name: storage
      spec:
        accessModes:
          - {{ .Values.persistence.accessMode }}
        storageClassName: {{ .Values.persistence.storageClass }}
        resources:
          requests:
            storage: {{ .Values.persistence.size }}
  {{ end }}



