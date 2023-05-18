#!/bin/sh
storage_class=$1

# Install the CP4I operator into all namespaces
NAMESPACE=integration
oc project $NAMESPACE

echo "apiVersion: integration.ibm.com/v1beta1
kind: PlatformNavigator
metadata:
  name: platform-navigator
  namespace: $NAMESPACE
spec:
  license:
    accept: true
    license: L-RJON-CJR2RX
  mqDashboard: true
  replicas: 1
  storage:
    class: $storage_class
  version: 2022.4.1" | oc apply -f -

