# cp4i-install
Set of scripts that can be used to help with the installation of the Cloud Pak for Integration Operator and select sub-components of the same.

## Pre-requisites
- The OCP cli must be installed on the machine these scripts will be executed on. The easiest way to achieve this is from the OpenShift UI and clicking on the '?' followed by 'Command line tools'. From there you can download the version of the tool that aligns with your machines operating system.

- Obtain an Entitlement Key and record it somewhere for use later. See https://www.ibm.com/docs/en/cloud-paks/cp-integration/2022.4?topic=ayekoi-applying-your-entitlement-key-using-cli-online-installation

- Log into the OpenShift cluster using the OCP cli installed above. A quick method of doing this is to click on your User name dropdown in OpenShift UI and selecting 'Copy login command -> Display Token' and then copying the 'Log in with this token' into a terminal session on the machine the scripts will be executed

## Scripts and order they should be run


1-create-catalog.sh           This will enable access to the IBM operator catalog from which the Cloud Pak for Integration operators will be deployed

                              Required parameters: None
                                                            
2-install-operator.sh         Install the **Cloud Pak for Integration** operator into the openshift-operators project

                              Required parameters: None
                              
2-install-ace-operator.sh     Install the **IBM App Connect** operator into the openshift-operators project

                              Required parameters: None
                              
2-install-apic-operator.sh    Install the **IBM API Connect** operator into the openshift-operators project

                              Required parameters: None
                              
3-add-pull-secret.sh          Creates a new project called **integration** and adds a secret containing the entitlement key determined early to enable access to the CP4I images

                              Required parameters: Single parameter that is the entitlement key obtained previously
                              Example:
                              ./3-add-pull-secret.sh _very-long-key-with-no-spaces_ 
                              
4-deploying-platform-ui.sh    Installs an instance of the Platform UI into the **integration** project

                              Required parameters: Single parameter that is a ReadWriteMany storage class. A list of defined storage classes can be found using the OpenShift UI or running 'oc get sc'
                              Example:
                              ./4-deploying-platform-ui.sh ocs-storagecluster-cephfs

4-deploying-ace-dashboard.sh  Installs an instance of the Integration Dashboard into the **integration** project

                              Required parameters: Single parameter that is a ReadWriteMany storage class. A list of defined storage classes can be found using the OpenShift UI or running 'oc get sc'
                              Example:
                              ./4-deploying-ace-dashboard.sh ocs-storagecluster-cephfs

4-deploying-ace-designer.sh   Installs an instance of the Integration Designer into the **integration** project

                              Required parameters: Single parameter that is a ReadWriteMany storage class. A list of defined storage classes can be found using the OpenShift UI or running 'oc get sc'
                              Example:
                              ./4-deploying-ace-designer.sh ocs-storagecluster-cephfs

4-deploying-api-connect.sh    Installs an API Management instance into the **integration** project

                              Required parameters: Single parameter that is a ReadWriteOnce Block storage class. A list of defined storage classes can be found using the OpenShift UI or running 'oc get sc'
                              Example:
                              ./4-deploying-api-connect.sh ocs-storagecluster-ceph-rbd
