{{ if .Values.service.admin.enabled }}
---
apiVersion: v1
kind: Service
metadata:
  name: {{ .Release.Name }}-weba
spec:
  selector:
    app.kubernetes.io/component: {{ .Release.Name }}
    app.kubernetes.io/instance: {{ .Release.Name }}
    app.kubernetes.io/managed-by: Helm
    app.kubernetes.io/name: communigate
    app.kubernetes.io/version: {{ .Chart.AppVersion }}
  ports:
    - name: httpa
      protocol: TCP
      port: 9010
      targetPort: 9010
{{ end }}

{{ if .Values.service.web.enabled }}
---
apiVersion: v1
kind: Service
metadata:
  name: {{ .Release.Name }}-webu
spec:
  selector:
    app.kubernetes.io/component: {{ .Release.Name }}
    app.kubernetes.io/instance: {{ .Release.Name }}
    app.kubernetes.io/managed-by: Helm
    app.kubernetes.io/name: communigate
    app.kubernetes.io/version: {{ .Chart.AppVersion }}
  ports:
    - name: httpa
      protocol: TCP
      port: 443
      targetPort: 443
{{ end }}

{{ if .Values.service.imap.enabled }}
---
apiVersion: v1
kind: Service
metadata:
  name: {{ .Release.Name }}-imap
spec:
  selector:
    app.kubernetes.io/component: {{ .Release.Name }}
    app.kubernetes.io/instance: {{ .Release.Name }}
    app.kubernetes.io/managed-by: Helm
    app.kubernetes.io/name: communigate
    app.kubernetes.io/version: {{ .Chart.AppVersion }}
  ports:
    - name: imap
      protocol: TCP
      port: 143
      targetPort: 143
      {{ if .Values.service.imap.nodePort }}
      nodePort: {{ .Values.service.imap.nodePort }}
      {{ end }}
    - name: imap-ssl
      protocol: TCP
      port: 993
      targetPort: 993
      {{ if .Values.service.imap.sslNodePort }}
      nodePort: {{ .Values.service.imap.sslNodePort }}
      {{ end }}
  type: NodePort
{{ end }}

{{ if .Values.service.smtp.enabled }}
---
apiVersion: v1
kind: Service
metadata:
  name: {{ .Release.Name }}-smtp
spec:
  selector:
    app.kubernetes.io/component: {{ .Release.Name }}
    app.kubernetes.io/instance: {{ .Release.Name }}
    app.kubernetes.io/managed-by: Helm
    app.kubernetes.io/name: communigate
    app.kubernetes.io/version: {{ .Chart.AppVersion }}
  ports:
    - name: smtp
      protocol: TCP
      port: 25
      targetPort: 25
      {{ if .Values.service.smtp.nodePort }}
      nodePort: {{ .Values.service.smtp.nodePort }}
      {{ end }}
    - name: smtp-ssl
      protocol: TCP
      port: 465
      targetPort: 465
      {{ if .Values.service.smtp.sslNodePort }}
      nodePort: {{ .Values.service.smtp.sslNodePort }}
      {{ end }}
  type: NodePort
{{ end }}
