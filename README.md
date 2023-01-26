# Helm CRDs Research

## Table of Contents
- [Introduction](#introduction)
- [Approaches](#approaches)
    - [CRD Installation Hooks](#crd-installation-hooks)
        - [Testing](#testing)
        - [Effects](#effects)
    - [CRDs included in Templates](#crds-included-in-templates)
        - [Testing](#testing-1)
        - [Effects](#effects-1)
- [Conclusion](#conclusion)

## Introduction
Since working with [Kubernetes](https://kubernetes.io/) and [Helm](https://helm.sh/) I have been looking for the best way to manage and use CRDs. I have found that there are a few different ways to do this and this project is simply a way to document my findings.

## Approaches
There are a few different approaches to managing CRDs in Helm. I have found that there are two main approaches:
- [CRD Installation Hooks](https://helm.sh/docs/chart_best_practices/custom_resource_definitions/#method-1-let-helm-do-it-for-you)
- [CRDs included in Templates](https://helm.sh/docs/chart_best_practices/custom_resource_definitions/#method-2-separate-charts)

## CRD Installation Hooks
When installing a chart with CRDs, Helm will install the CRDs before any of the resources in the chart. If the CRDs already exist, Helm will skip them.

## Testing
Testing can be done using make, kubectl and helm. The following commands can be used to test the approaches:
- `make run-installation` Runs the installation approach
- `make remove-installation` Deletes the installation approach
- `make clean-installation` Cleans the installation approach (includes CRD removal)

### Effects
- Helm won't manage the CRDs (so it can be deleted by anyone)
- Helm won't update the CRDs
- CRDs are installed before any of the resources in the chart
- You can create a CRD and CR in the same chart

## CRDs included in Templates
When installing a chart with CRDs in the templates, Helm will install the CRDs according to [their default order](https://helm.sh/docs/intro/using_helm/#helm-install-installing-a-package). Most of the time this will be before any of the resources in the chart.

## Testing
Testing can be done using make, kubectl and helm. The following commands can be used to test the approaches:
- `make run-templates-combined` Runs the combined templates approach
- `make remove-templates-combined` Deletes the combined templates approach
- `make clean-templates-combined` Cleans the combined templates approach

### Effects
- Helm manages the CRDs
- Helm will update the CRDs
- CRDs are installed before any of the resources in the chart (most of the time)
- You can't create a CR before the CRD is installed (so not a good option for CRDs that are required by other resources in the same chart)

# Conclusion
I have found that if you want to install CRDs and CRs at the same time, the best approach is to use the Helm CRD Installation. 

If you want to install CRDs and CRs separately, the best approach is to use the CRDs included in Templates. This is because Helm manages the CRDs and will update them if they are changed.
