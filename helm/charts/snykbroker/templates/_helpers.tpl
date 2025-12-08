{{- define "snykbroker.name" -}}
snykbroker
{{- end }}

{{- define "snykbroker.fullname" -}}
{{ printf "%s-%s" .Release.Name "snykbroker" }}
{{- end }}

{{- define "snykbroker.image" -}}
{{ .Values.image.repository }}:{{ .Values.image.tag }}
{{- end }}

