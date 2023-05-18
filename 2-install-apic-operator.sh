#!/bin/sh
########################################################
# Install the API Connect operator into all namespaces #
########################################################

NAMESPACE=openshift-operators
oc project ${NAMESPACE}

echo "apiVersion: operators.coreos.com/v1alpha1
kind: Subscription
metadata:
  name: ibm-apiconnect
  namespace: openshift-operators
spec:
  channel: v3.3
  name: ibm-apiconnect
  source: ibm-operator-catalog
  sourceNamespace: openshift-marketplace" | oc apply -f -

