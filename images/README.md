# Spark

This is a Docker image appropriate for running Spark on Kuberenetes. It produces two main images:
* `spark-master` - Runs a Spark master in Standalone mode and exposes a port for Spark and a port for the WebUI.
* `spark-worker` - Runs a Spark worer in Standalone mode and connects to the Spark master via DNS name `spark-master`.


You can find the built images in these repos:

https://quay.io/repository/eddie_esquivel/spark-master

https://quay.io/repository/eddie_esquivel/spark-worker
