curl -k -X POST \
  -H "Content-Type: application/json" \
  -H 'X-Authentication:<token>' \
  https://<mom or compile master>:8143/orchestrator/v1/command/task \
  -d '{
    "environment" : "production",
    "task" : "::puppet_agent",
    "params" : {
      "noop" : true,
      "puppet_master" : "<compile master to use for this specific agent run>"
    },
    "scope" : {
      "nodes" : ["<node1>", "<node2>"]
    }
  }'
