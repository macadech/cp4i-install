#!/bin/sh
#################################################
# Install the CP4I operator into all namespaces #
#################################################

NAMESPACE=openshift-operators
oc project ${NAMESPACE}

echo "apiVersion: operators.coreos.com/v1alpha1
kind: Subscription
metadata:
  name: ibm-integration-platform-navigator
spec:
  channel: v7.0
  name: ibm-integration-platform-navigator
  source: ibm-operator-catalog
  sourceNamespace: openshift-marketplace" | oc apply -f -
