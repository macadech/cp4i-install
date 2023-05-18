#!/bin/sh
#################################################
# Install the ACE operator into all namespaces #
#################################################

NAMESPACE=openshift-operators
oc project ${NAMESPACE}

echo "apiVersion: operators.coreos.com/v1alpha1
kind: Subscription
metadata:
  name: ibm-appconnect
  namespace: openshift-operators
spec:
  channel: v8.1
  name: ibm-appconnect
  source: ibm-operator-catalog
  sourceNamespace: openshift-marketplace" | oc apply -f -

