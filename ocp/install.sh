#!/bin/bash

oc create -f ./deployment.yaml
oc create -f ./service.yaml
oc create -f ./route.yaml
