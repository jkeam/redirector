#!/bin/bash

oc delete -f ./route.yaml
oc delete -f ./service.yaml
oc delete -f ./deployment.yaml
