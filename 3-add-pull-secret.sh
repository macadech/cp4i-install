#!/bin/sh
entitlement_key=$1

#############################################################################
# Add a new project / namespace and assign a secret for the entitlement key #
#############################################################################

# Add the new namespace to use for CP4I capabilities
NAMESPACE=integration
oc new-project $NAMESPACE

# Add the secret to the namespace created above
oc create secret docker-registry ibm-entitlement-key \
    --docker-username=cp \
    --docker-password=$entitlement_key \
    --docker-server=cp.icr.io \
    --namespace=$NAMESPACE

