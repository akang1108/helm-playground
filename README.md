# helm-playground

My attempt at trying different things with Helm and Kubernetes. Using the repo to do some additional testing locally with ArgoCD.

## Requirements

* Helm 3.5+
* Kubernetes v1.20+ running on local node(s). I used Minikube backed by Docker for Mac.

## Project structure

```
├── charts                      Helm charts
│     ├── hello-world-job       Kubernetes Job Helm chart example
│     ├── hello-world-cronjob   Kubernetes CronJob Helm chart example
├── repo                        My public Helm repository
```

## Example commands

```bash
$ helm template --debug charts/hello-world-job                # verify Helm templating
$ helm upgrade --install nice-job charts/hello-world-job      # install a job
```

## Add Helm chart to Helm repo

Used this as reference to learn: https://blog.softwaremill.com/hosting-helm-private-repository-from-github-ff3fa940d0b7

```bash
helm package charts/hello-world-job -d repo/    # Add packaged hello-world-job chart to repo/
helm repo index repo/                           # Create new index yaml referencing charts

# Then pushed up these changes to github
```

