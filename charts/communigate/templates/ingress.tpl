{{ if .Values.ingress.admin.enabled }}
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: {{ .Release.Name }}-weba-ingress
  annotations:
{{ toYaml .Values.ingress.admin.annotations | indent 4 | trimSuffix "\n" }}
spec:
  ingressClassName: {{ .Values.ingress.admin.className }}
  rules:
    - host: {{ .Values.ingress.admin.host }}
      http:
        paths:
          - path: {{ .Values.ingress.admin.path }}
            pathType: {{ .Values.ingress.admin.pathType | default "Prefix" }}
            backend:
              service:
                name: {{ $.Release.Name }}-weba
                port:
                  number: 9010
{{- end }}

{{- if .Values.ingress.web.enabled }}
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: {{ .Release.Name }}-webu-ingress
  annotations:
{{ toYaml .Values.ingress.web.annotations | indent 4 | trimSuffix "\n" }}
spec:
  ingressClassName: {{ .Values.ingress.web.className }}
  rules:
    - host: {{ .Values.ingress.web.host }}
      http:
        paths:
          - path: {{ .Values.ingress.web.path }}
            pathType: {{ .Values.ingress.web.pathType | default "Prefix" }}
            backend:
              service:
                name: {{ $.Release.Name }}-webu
                port:
                  number: 443
{{- end }}
