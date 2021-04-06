#!/bin/bash
ovs_flows_count=$(sudo ovs-dpctl dump-flows|wc -l)
echo "OK - $ovs_flows_count | Count=$ovs_flows_count"
exit 0

fi
