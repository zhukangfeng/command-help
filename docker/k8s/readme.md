# k8s help document
<!-- TOC -->

- [k8s help document](#k8s-help-document)
    - [create kubernetes](#create-kubernetes)
    - [get nodes](#get-nodes)
    - [redeploy pods](#redeploy-pods)
    - [create secret](#create-secret)

<!-- /TOC -->

## create kubernetes
`sudo snap  install microk8s --classic`

## get nodes
`microk8s.kubectl get nodes`

## redeploy pods
`
kubectl replace --force -f deployment.yaml 
`
## create secret
`
kubectl create secret docker-registry regcred --docker-server=<your-registry-server> --docker-username=<your-name> --docker-password=<your-pword> --docker-email=<your-email>
`
