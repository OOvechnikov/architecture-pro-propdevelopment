#!/bin/bash

AUDIT_LOG="audit.log"
OUT_JSON="audit-extract.json"

jq -s 'map(
  select(
    (.objectRef.resource == "secrets" and .verb == "get") or
    (.verb == "create" and .objectRef.subresource == "exec") or
    (.objectRef.resource == "pods" and (.requestObject.spec.containers[]?.securityContext.privileged == true)) or
    (.objectRef.resource == "rolebindings" and .verb == "create") or
    (.objectRef.name | tostring | test("audit-policy"))
  )
)' "$AUDIT_LOG" > "$OUT_JSON"
