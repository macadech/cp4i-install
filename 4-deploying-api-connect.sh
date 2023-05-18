#!/bin/sh
storage_class=$1

#########################################################################
# Install the API Connect Management instance into intergration project #
#########################################################################
NAMESPACE=integration
oc project $NAMESPACE

echo "apiVersion: apiconnect.ibm.com/v1beta1
kind: APIConnectCluster
metadata:
  labels:
    app.kubernetes.io/instance: apiconnect
    app.kubernetes.io/managed-by: ibm-apiconnect
    app.kubernetes.io/name: apiconnect-small
  name: small
  namespace: $NAMESPACE
spec:
  analytics:
    mtlsValidateClient: true
  license:
    accept: true
    license: L-VQYA-YNM22H
    metric: VIRTUAL_PROCESSOR_CORE
    use: nonproduction
  portal:
    mtlsValidateClient: true
  profile: n1xc7.m48
  version: 10.0.5.3
  storageClassName: $storage_class" | oc apply -f -

  # storageClassName: ocs-storagecluster-ceph-rbd
