#!/bin/sh
storage_class=$1

###############################################################
# Install the ACE Dashboard instance into ntegraionnamespaces #
###############################################################
NAMESPACE=integration
oc project $NAMESPACE

echo "apiVersion: appconnect.ibm.com/v1beta1
kind: Dashboard
metadata:
  name: dashboard
  namespace: $NAMESPACE
spec:
  license:
    accept: true
    license: L-MJTK-WUU8HE
    use: CloudPakForIntegrationNonProduction
  pod:
    containers:
      content-server:
        resources:
          limits:
            memory: 512Mi
          requests:
            cpu: 50m
            memory: 50Mi
      control-ui:
        resources:
          limits:
            memory: 512Mi
          requests:
            cpu: 50m
            memory: 125Mi
  storage:
    size: 5Gi
    type: persistent-claim
    class: $storage_class
  replicas: 1
  useCommonServices: true
  version: '12.0'
  displayMode: IntegrationServers" | oc apply -f -

