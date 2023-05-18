#!/bin/sh
storage_class=$1

##############################################################
# Install the ACE Designer instance into ntegraionnamespaces #
##############################################################
NAMESPACE=integration
oc project $NAMESPACE

echo "apiVersion: appconnect.ibm.com/v1beta1
kind: DesignerAuthoring
metadata:
  name: designer
  namespace: $NAMESPACE
spec:
  license:
    accept: true
    license: L-MJTK-WUU8HE
    use: CloudPakForIntegrationNonProduction
  couchdb:
    storage:
      size: 10Gi
      type: persistent-claim
      class: $storage_class
    replicas: 1
  designerMappingAssist:
    incrementalLearning:
      schedule: Every 15 days
    enabled: true
  designerFlowsOperationMode: local
  replicas: 1
  useCommonServices: true
  version: '12.0'" | oc apply -f -

